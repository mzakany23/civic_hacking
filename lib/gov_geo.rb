require 'mechanize'
require 'json'
require_relative 'gov_scrape'

class GovGeo
	def initialize(api)
		@api = api
	end

	def coord(address)
		json = Mechanize.new.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&key=#{@api}").body
		JSON.parse(json)['results'][0]['geometry']['viewport']['northeast']
	end
end