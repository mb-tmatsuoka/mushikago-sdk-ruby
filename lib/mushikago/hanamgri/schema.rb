# -*- coding : utf-8 -*-
require 'json'
module Mushikago
  module Hanamgri
    class Schema
      attr_reader :fields
      
      def initialize(&block)
        @fields = []
        instance_eval(&block) if block_given?
      end
      
      def add field_or_hash
        field = field_or_hash
        if field.kind_of?(Hash)
          field = Mushikago::Hanamgri::Field.new(field[:name], field[:required], field[:type], field[:knowledge_name])
        end
        field.validate!
        @fields << field
      end

      def to_json *args
        {:fields => @fields}.to_json(args)
      end
    end
  end
end

