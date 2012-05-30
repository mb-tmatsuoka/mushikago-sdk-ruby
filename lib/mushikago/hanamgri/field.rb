# -*- coding : utf-8 -*-
require 'json'
module Mushikago
  module Hanamgri
    class Field < Struct.new(:name, :required, :type, :knowledge_name)
      def validate!
        raise "Invalid Type Value [#{type}]" unless [:string, :number].include?(type)
      end

      def required?
        !!required
      end

      def to_json *args
        {:name => name.to_s, :required => required?, :type => type, :knowledge_name => knowledge_name}.to_json(args)
      end
    end
  end
end

