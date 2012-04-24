# -*- coding : utf-8 -*-
require 'json'
module Mushikago
  module Ponz
    class Field < Struct.new(:name, :required, :type)
      def validate!
        raise "Invalid Type Value [#{type}]" unless [:string, :number].include?(type)
      end

      def required?
        !!required
      end

      def to_json *args
        {:name => name.to_s, :required => required?, :type => type}.to_json(args)
      end
    end
  end
end

