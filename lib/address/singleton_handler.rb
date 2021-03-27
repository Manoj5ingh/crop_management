require 'address/handler.rb'
module Address
  class SingletonHandler
    @handler = nil
    @mutex = Mutex.new
    class << self      
      def get_handler
        @handler || create_handler
      end
      
      def create_handler
        @mutex.synchronize do
          return @handler if(!@handler.nil?)
         
          @handler = Address::Handler.new()
          return @handler
        end
      end
    end
  end
end