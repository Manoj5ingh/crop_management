require 'address/mandi.rb'
require 'address/district.rb'
require 'address/state.rb'
require 'address/key.rb'

module Address
  class Handler
    attr :states
    def initialize()
      @states = Hash.new
    end

    def insert_state(state_name)
      state = Address::State.new(state_name)
      @states[state_name] = state
    end

    def get_insert_state_district_mandi(state_name, district_name, mandi_name)
      state = get_insert_state(state_name)
      district = state.get_insert_district(district_name)
      mandi = district.get_insert_mandi(mandi_name)
      return Address::Key.new(state_name, district_name, mandi_name)
    end

    def get_insert_state(state_name)
      insert_state(state_name) unless(@states.include?(state_name))
      
      return @states[state_name]
    end

    def get_mandis_by_state_and_dist(state_name, dist_name)
      mandi_list = []
      return mandi_list if(@states[state_name].nil? || @states[state_name].districts[dist_name].nil?)
      @states[state_name].districts[dist_name].mandis.each do |k,v|
        mandi_list << Address::Key.new(state_name, dist_name, k)
      end
      return mandi_list
    end
  end
end