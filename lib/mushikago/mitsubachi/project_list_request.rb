# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    class ProjectListRequest < Request
      def method_name; 'project/list' end
      request_parameter :limit do |v| v.to_i end
      request_parameter :offset do |v| v.to_i end
      request_parameter :filter

      def initialize options={}
        super(options)
        self.limit = options[:limit] if options.has_key?(:limit)
        self.offset = options[:offset] if options.has_key?(:offset)
        self.filter = options[:filter] if options.has_key?(:filter)
      end
    end
  end
end



