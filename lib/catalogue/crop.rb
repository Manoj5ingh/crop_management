require 'catalogue/variety.rb'
module Catalogue
  class Crop
    attr :name, :varieties
    def initialize(name, varieties=Set.new)
      @name = name
      @varieties = Hash.new
      varieties.each do |variety|
        @varieties[variety.name] = variety
      end
    end
    
    def insert_variety(variety_name)
      variety = Catalogue::Variety.new(variety_name)
      @varieties[variety_name] = variety
    end

    def get_insert_variety(variety_name)
      insert_variety(variety_name) unless(@varieties.include?(variety_name))
      
      return @varieties[variety_name]
    end
    
    def eql?(an_other)
      self.name == an_other.name 
    end
    
    def hash
      @name.hash
    end
  end
end