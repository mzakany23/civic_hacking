require_relative '../lib/gov_scrape'

describe 'GovScrape' do 
	# context 'Utility' do 

	# 	before do 
	# 		@gov  = GovScrape.new
	# 		@path = "csvs/stats.csv"
	# 	end

	# 	it 'records' do 
	# 		expect(@gov.grab_data.full_records).to eq(7399)
	# 	end

	# 	it 'pages' do 
	# 		expect(@gov.grab_data.full_pages).to eq(493)
	# 	end

	# 	it 'should pick up where left off' do 
	# 		expect(GovScrape.new(1,2).grab_data.addresses.count).to eq(30)
	# 	end

	# 	it 'should grab 15 entries' do 
	# 		expect(GovScrape.new(1).grab_data.addresses.count).to eq(15)
	# 	end


	# 	it 'pages left' do 
	# 		expect(GovScrape.new(1).pages_left).to eq(492)
	# 	end

	# 	it 'records left' do 
	# 		expect(GovScrape.new(1).records_left).to eq(7384)
	# 	end
	# end

	context "CSV" do 
		let(:gov) {GovScrape.new(420)}

		before do 
			@path = 'csvs/stats1.csv'
		end

		it 'should print some records' do 
			# GovScrape.new(132).grab_data.to_csv(@path)
		end

		it 'how many records is this range' do 
			expect(GovScrape.new(132,265).how_many_records_is_this?).to eq(1995)
		end

		it 'should print within range' do 
			fake = double(GovScrape.new(420,493))
			allow(fake).to receive(:grab_data).and_return({lat: 34})

			# GovScrape.new(420,493).grab_data.to_csv('csvs/stats.csv')
			# p GovScrape.new(420).pages_left
		end

		# it 'should stop a print and find the last full record' do 
		# 	expect(GovScrape.next_div_15(2079)).to eq(2070)
		# end

		# it 'should show left' do 
		# 	expect(GovScrape.new(265).records_left).to eq(3424)
		# end
	end


end