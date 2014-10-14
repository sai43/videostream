# encoding: utf-8

class VideoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MimeTypes
  
  # Choose what kind of storage to use for this uploader:
  #storage :file
 
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
      %w(mp4 ogv avi)
  end

 

end
