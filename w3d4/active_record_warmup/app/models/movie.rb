class Movie < ActiveRecord::Base
	belongs_to :director,
		class_name: "Actor"
	has_many :castings
	has_many :super_actors,
		through: :castings,
		source: :actor
end
