require_relative '../lib/gov_geo'
require_relative '../lib/gov_scrape'

describe 'GovGeo' do 

	before do 
		api  = 'AIzaSyBCm1e-xWsP_OpovJ_IOdWcfU4EI41K57I'
		# @gov = GovGeo.new(api)
	end

	# context 'Coordinates'
	it 'should get lat and lon from multiple address' do 
		add  = "1436+55+ST,+Cleveland,+OH"
		hmm  = "0+JOHN+AVE,+Cleveland,+OH"
		ano  = '533+E+105+ST,Cleveland,+OH'
		# p @gov.coord(ano)
	end

	# # it 'addresses from method' do 
	# # 	a = GovScrape.new
	# # 	coord = @gov.coord(a.addresses[0])
	# # 	coord['lat']
	# # 	coord['lng']
	# # end
	# end
end