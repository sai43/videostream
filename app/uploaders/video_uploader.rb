# encoding: utf-8

class VideoUploader < CarrierWave::Uploader::Base
 
  include CarrierWave::MimeTypes
  include CarrierWave::Video
  storage :file

    def store_dir
     "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

	DEFAULTS = {
				watermark: {
				path: Rails.root.join('mutube.png')
					}
				}

	version :mp4 do
		process :encode
	    end


	def encode
		encode_video(:mp4, DEFAULTS) do |movie, params|
		   if movie.height < 720
		     params[:watermark][:path] = Rails.root.join('mutube.png')
           end
		end
	end

 	def extension_white_list
	   %w(mp4 ogv avi)
	end

 
end
