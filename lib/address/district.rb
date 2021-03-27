module Address
  class District
    attr :name, :mandis
    def initialize(name, mandis=Set.new)
      @name = @name
      @mandis = Hash.new
      mandis.each do |mandi|
        @mandis[mandi.name] = mandi
      end
    end
    
    def insert_mandi(mandi_name)
      mandi = Address::Mandi.new(mandi_name)
      @mandis[mandi_name] = mandi
    end

    def get_insert_mandi(mandi_name)
      insert_mandi(mandi_name) unless(@mandis.include?(mandi_name))
      
      return @mandis[mandi_name]
    end
    
    def eql?(an_other)
      self.name == an_other.name 
    end
    
    def hash
      @name.hash
    end
  end
end