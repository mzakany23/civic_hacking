require_relative '../lib/upload'


describe 'Upload' do 
	before do 
		path    = "../csvs/stats.csv"
		@upload = Upload.new(path)
	end

	it 'should upload all transactions' do 
		@upload.to_psql
	end
end