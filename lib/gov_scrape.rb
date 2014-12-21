require 'mechanize'
require 'nokogiri'
require 'csv'
require 'json'
require_relative 'gov_geo'


class GovScrape 
	def initialize(from=0,max_cycles=0)
		@path       = "http://cd.city.cleveland.oh.us/scripts/cityport.php"
		@count      = (from*15).to_i
		@max_cycles = (max_cycles*15).to_i
		page_count
		@max_cycles = @count if @count > @max_cycles
	end

	def everything
		@store_arr
	end

	def addresses
		@addresses
	end

	def full_pages
		(@records/15).to_i
	end

	def full_records
		@records
	end

	def pages_left
		(@records-@count)/15
	end

	def records_left
		@records-@count
	end

	def show
		@store_arr.each {|c| p c }
	end

	def how_many_records_is_this?
		@max_cycles-@count
	end

	def self.how_many_pages_is_this?(num)
		return num/15
	end

	def self.next_div_15(num)
		found = false

		while !found
			if num % 15 == 0
				return num
				found = true
			else
				num-=1
			end
		end

	end

	def to_csv(path)
		CSV.open(path, 'a+') do |csv_line|
			# csv_line << ["PPN", "Stree Number", "Street Name", "SPA", "SPA Name", "Front of Parcel", "Debth of Parcel", "Sq feet", "Ward", "Old Ward",'lat','lon']
			@store_arr.each_with_index do |line,i|
				coord = GovGeo.new('AIzaSyBCm1e-xWsP_OpovJ_IOdWcfU4EI41K57I').coord(addresses[i])
				csv_line << ["#{line[1]}","#{line[2]}","#{line[3]}","#{line[4]}","#{line[5]}","#{line[6]}","#{line[7]}","#{line[8]}","#{line[9]}","#{line[10]}","#{coord['lat']}","#{coord['lng']}"]
			end
		end
	end

	def grab_data #max is 493
		@store_arr = []
		@addresses = []

		while @count <= @max_cycles
			url = "http://cd.city.cleveland.oh.us/scripts/cityport.php?PME_sys_fm=#{@count}&PME_sys_fl=1&PME_sys_qfn=&PME_sys_sfn[0]=0&PME_sys_sfn[1]=-0"	
			page = Nokogiri::HTML(Mechanize.new.get(url).body)
			page.css('table tr').each do |row|
				value = row.content.split(/\n/)
				next if value[1] == 'PPN' && value[2] == 'Street Number'
				next if value.count < 3
				next if value[1].to_i.size > 10
				next if value[1] == ""
				@store_arr << value
				@addresses << "#{value[2]}+#{value[3]},".gsub(/\s/,'+') + "Cleveland,+OH"
			end
			@count += 15
		end
		self
	end










	private 

	def last_page(x)
		return x/15 if x % 15 == 0
		last_page(x-1)
	end


	def page_count
		url = Mechanize.new.get('http://cd.city.cleveland.oh.us/scripts/cityport.php?PME_sys_fm=0&PME_sys_fl=1&PME_sys_qfn=&PME_sys_sfn[0]=0&PME_sys_sfn[1]=-0').body
		@records = 0
		page = Nokogiri::HTML(url)
		page.css('.pme-stats').each do |line|
			@records = line.content.match(/(?<overall>\d{4,5})/)[:overall].to_i
		end
		self
	end

end
