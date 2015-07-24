class Zodiak < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :css_class
end
