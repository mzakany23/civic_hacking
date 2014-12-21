require 'active_record'
require 'uri'

class Connection
	db = URI.parse('postgres://mzakany:zekezeke23@localhost:5432/records')

		ActiveRecord::Base.establish_connection(
		  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
		  :host     => db.host,
		  :username => db.user,
		  :password => db.password,
		  :database => db.path[1..-1],
		  :encoding => 'utf8'
		)
end


class Address < ActiveRecord::Base
	validates :ppn, uniqueness: true	
end
