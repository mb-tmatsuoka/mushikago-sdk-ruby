# -*- coding : utf-8 -*-
require 'json'
module Mushikago
  module Hanamgri
    class TrainingData
      attr_reader :training_data
      
      def initialize(&block)
        @training_data = {}
        instance_eval(&block) if block_given?
      end
      
      def []= key, value
        @training_data[key] = value
      end

      def put key, value
        @training_data[key] = value
      end

      def to_json *args
        @training_data.to_json(args)
      end
    end
  end
end

