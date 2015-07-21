# encoding: utf-8

class CoverUploader < CarrierWave::Uploader::Base

	include CarrierWave::MiniMagick

	storage :file

	def store_dir
		"uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
	end

	process resize_to_fit: [600, 400]


	def extension_white_list
	  %w(jpg jpeg gif png)
	end

	def filename
	  @name ||= "#{timestamp}-#{super}" if original_filename.present? and super.present?
	end

	def timestamp
		var = :"@#{mounted_as}_timestamp"
		model.instance_variable_get(var) or model.instance_variable_set(var, Time.now.to_i)
	end

end
