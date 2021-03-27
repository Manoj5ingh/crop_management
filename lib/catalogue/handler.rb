require 'catalogue/variety.rb'
require 'catalogue/crop.rb'
require 'catalogue/key.rb'

module Catalogue
  class Handler
    attr :crops
    def initialize()
      @crops = Hash.new
    end

    def insert_crop(crop_name)
      crop = Catalogue::Crop.new(crop_name)
      @crops[crop_name] = crop
    end

    def get_insert_crop_and_variety(crop_name, variety_name)
      crop = get_insert_crop(crop_name)
      variety = crop.get_insert_variety(variety_name)
      return Catalogue::Key.new(crop.name, variety.name); 
    end
    def get_varieties(crop_name)
      result = []
      return result if(@crops[crop_name].nil?)
      varieties = @crops[crop_name].varieties
      varieties.each do |k, variety|
        result << Catalogue::Key.new(crop_name, variety.name)
      end 
      return result
    end

    def get_insert_crop(crop_name)
      insert_crop(crop_name) unless(@crops.include?(crop_name))
      
      return @crops[crop_name]
    end
  end
end