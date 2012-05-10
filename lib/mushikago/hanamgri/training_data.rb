# -*- coding : utf-8 -*-
require 'json'
module Mushikago
  module Hanamgri
    class TrainingData
      attr_reader :training_data
      
      def initialize(&block)
        @training_data = []
        instance_eval(&block) if block_given?
      end
      
      def add field_or_hash
        element = field_or_hash
        if element.kind_of?(Hash)
          element = Mushikago::Hanamgri::Element.new(element[:key], element[:value])
        end
        @training_data << element
      end

      def to_json *args
        {:training_data => @training_data}.to_json(args)
      end
    end
  end
end

