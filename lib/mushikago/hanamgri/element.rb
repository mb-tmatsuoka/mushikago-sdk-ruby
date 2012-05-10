# -*- coding : utf-8 -*-
require 'json'
module Mushikago
  module Hanamgri
    class Element < Struct.new(:key, :value)
      
      def required?
        !!required
      end

      def to_json *args
        {:key => key.to_s, :value => value}.to_json(args)
      end
    end
  end
end

