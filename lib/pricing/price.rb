require 'date'
module Pricing
  class Price
    include Comparable
    attr :date, :price
    def initialize(date, price)
      @date = Date.parse(date)
      @price = price
    end

    def <=>(an_other)
      temp = self.date <=> an_other.date
      return -temp
    end

    def eql?(an_other)
      self.date == an_other.date
    end
    
    def hash
      @date.hash
    end
  end
end