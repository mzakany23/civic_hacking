require 'pg'
require 'active_record'
require_relative 'models'

Connection.new

# "PPN", "Stree Number", "Street Name", "SPA", "SPA Name", "Front of Parcel", "Debth of Parcel", "Sq feet", "Ward", "Old Ward",'lat','lon'

ActiveRecord::Schema.define do
	create_table :addresses do |t|
		t.integer :ppn
		t.integer :street_num
		t.string  :street_nam
		t.integer :spa 
		t.string  :spa_name
		t.integer :parcel_front
		t.integer :parcel_debth
		t.integer :parcel_footage
		t.integer :ward  
		t.integer :old_ward
		t.decimal :lat
		t.decimal :lng
		
		t.timestamps
	end
end



