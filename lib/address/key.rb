module Address
  class Key
    attr :state_name, :dist_name, :mandi_name
    def initialize(state_name, dist_name, mandi_name)
      @state_name = state_name
      @dist_name = dist_name
      @mandi_name = mandi_name
    end
    
    def eql?(an_other)
      self.state_name == an_other.state_name && self.dist_name == an_other.dist_name && self.mandi_name == an_other.mandi_name
    end
    
    def hash
      [@state_name, @dist_name, @mandi_name].hash
    end

    def to_s
      "#{state_name}, #{dist_name}, #{mandi_name}"
    end
  end
end