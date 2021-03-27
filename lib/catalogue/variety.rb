module Catalogue
  class Variety
    attr :name
    def initialize(name)
      @name = name
    end

    def eql?(an_other)
      self.name == an_other.name 
    end
    
    def hash
      @name.hash
    end
  end
end