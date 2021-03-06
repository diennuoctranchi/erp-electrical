module Erp
  module Electrical
    class ServiceCategoryIconUploader < CarrierWave::Uploader::Base
      include CarrierWave::MiniMagick
      storage :file

      def store_dir
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end

      version :system do
        process resize_to_fill: [150, 150]
      end

      version :detail_40x40 do
        process resize_to_fill: [40, 40]
      end
    end
  end
end