require 'address/district.rb'
module Address
  class State
    attr :name, :districts
    def initialize(name, districts=Set.new)
      @name = @name
      @districts = Hash.new
      districts.each do |district|
        @districts[district.name] = district
      end
    end

    def insert_district(district_name)
      dist = Address::District.new(district_name)
      @districts[district_name] = dist
    end

    def get_insert_district(district_name)
      insert_district(district_name) unless(@districts.include?(district_name))
      
      return @districts[district_name]
    end

    def eql?(an_other)
      self.name == an_other.name 
    end
    
    def hash
      @name.hash
    end
  end
end