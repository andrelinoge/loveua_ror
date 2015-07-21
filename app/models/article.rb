class Article < ActiveRecord::Base
	mount_uploader :cover, CoverUploader

	validates_presence_of :title, :cover, :content
	 
end