class Image < ActiveRecord::Base
	include Rails.application.routes.url_helpers

	mount_uploader :file, ImageUploader

	belongs_to :user

	def to_jq_upload
    {
			"name"        => read_attribute(:upload_file_name),
			"size"        => read_attribute(:upload_file_size),
			"url"         => file.url,
			"delete_url"  => image_path(self),
			"delete_type" => "DELETE" 
    }
  end

end
