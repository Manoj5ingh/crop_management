require 'catalogue/handler.rb'
module Catalogue
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
         
          @handler = Catalogue::Handler.new()
          return @handler
        end
      end
    end
  end
end