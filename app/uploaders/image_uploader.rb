# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file
  
  def store_dir
    "uploads/images/#{model.is_a?(User) ? model.id : model.user_id}"
  end

  process :resize_to_fit => [600, 400]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :big_thumb do
    process :resize_to_fit => [300, 300]
  end

  version :medium_thumb, from_version: :big_thumb do
    process :resize_to_fit => [100, 100]
  end

  version :small_thumb, from_version: :medium_thumb do
    process :resize_to_fit => [50, 50]
  end  

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    @name ||= "#{timestamp}-#{super}" if original_filename.present? and super.present?
  end

  def timestamp
    var = :"@#{mounted_as}_timestamp"
    model.instance_variable_get(var) or model.instance_variable_set(var, Time.now.to_i)
  end

end
