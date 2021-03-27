require 'inventory/storage_helper.rb'
module Inventory
  class Manager
    @handler = nil
    @mutex = Mutex.new
    class << self      
      def get_storage_helper
        @handler || create_handler
      end
      
      def create_handler
        @mutex.synchronize do
          return @handler if(!@handler.nil?)
         
          @handler = Inventory::StorageHelper.new()
          return @handler
        end
      end
    end
  end
end