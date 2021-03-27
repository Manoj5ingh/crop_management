require 'address/singleton_handler.rb'
require 'catalogue/singleton_handler.rb'
require 'pricing/price.rb'
require 'catalogue/key.rb'
require 'address/key.rb'
module Inventory
  class StorageHelper
    def initialize()
      @warehouse = Hash.new        #<AddressKey, <CropKey, price>> It will store in this format
      @address_handler = Address::SingletonHandler.get_handler()
      @catalogue_handler = Catalogue::SingletonHandler.get_handler()
    end

    def insert(state, dist, mandi, crop, variety, date, price)
      address_key = @address_handler.get_insert_state_district_mandi(state, dist, mandi)
      crop_key = @catalogue_handler.get_insert_crop_and_variety(crop, variety)
      price = Pricing::Price.new(date, price)

      @warehouse[address_key] = Hash.new unless(@warehouse.include?(address_key))
      @warehouse[address_key][crop_key] = SortedSet.new unless(@warehouse[address_key].include?(crop_key))
      @warehouse[address_key][crop_key] << price
      return @warehouse
    end

    def latest_price_by_state_dist_crop(state, dist, crop)
      address_keys = @address_handler.get_mandis_by_state_and_dist(state, dist)
      crop_keys = @catalogue_handler.get_varieties(crop)
      return [] if(address_keys.empty? || crop_keys.empty?)
      result = []
      address_keys.each do |address_key|
        crop_keys.each do |crop_key|
          mandi_data = @warehouse[address_key]
          crop_data = mandi_data[crop_key] unless(mandi_data.nil?)
          price = crop_data.first unless crop_data.nil?
          result << [address_key.to_s, crop_key.to_s, price] unless price.nil?
        end
      end
      return result
    end

    def limited_result(state, dist, mandi, crop, variety, points, days)
      address_key = @address_handler.get_insert_state_district_mandi(state, dist, mandi)
      crop_key = @catalogue_handler.get_insert_crop_and_variety(crop, variety)

      mandi_data = @warehouse[address_key]
      crop_data = mandi_data[crop_key] unless(mandi_data.nil?)
      return [] if(crop_data.nil? || crop_data.empty?)
      result = []
      tillDate = Date.today - days
      crop_data.each do |price|
        break if(points <= 0 || price.date <= tillDate)
        points = points - 1
        result << price
      end
      return result
    end
  end
end