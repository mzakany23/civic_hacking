require 'active_record'
require 'csv'
require_relative '../db/models'

class Upload 
	def initialize(path)
		Connection.new
		@path = path
	end

	def to_psql
		CSV.foreach(@path) do |line|
			upload(line[0],line[1],line[2],line[3],line[4],line[5],line[6],line[7],line[8],line[9],line[10],line[11])
		end
	end







	private

	def upload(ppn,street_num,street_nam,spa,spa_name,parcel_front,parcel_debth,parcel_footage,ward,old_ward,lat,lng)
		a 						    = Address.new
		a.ppn        			= ppn
		a.street_num 			= street_num				
		a.street_nam 			= street_nam
		a.spa   					= spa 
		a.spa_name				= spa_name
		a.parcel_front		= parcel_front
		a.parcel_debth		= parcel_debth
		a.parcel_footage	= parcel_footage
		a.ward 						= ward
		a.old_ward				= old_ward	
		a.lat							= lat
		a.lng							= lng
		a.created_at 			= Time.now
		a.updated_at 			= Time.now
		a.save
	end
end

