module Catalogue
  class Key
    attr :crop_name, :variety_name
    def initialize(crop_name, variety_name)
      @crop_name = crop_name
      @variety_name = variety_name
    end

    def eql?(an_other)
      self.crop_name == an_other.crop_name && self.variety_name == an_other.variety_name
    end
    
    def hash
      [@crop_name, @variety_name].hash
    end
    def to_s
      return "#{@crop_name}, #{@variety_name}"
    end
  end
end