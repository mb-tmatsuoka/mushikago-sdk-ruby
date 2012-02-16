# -*- coding: utf-8 -*-
module Mushikago
  module Hotaru
    class DomainListRequest < Request
      def method_name; 'domain/list' end
      request_parameter :limit do |v| v.to_i.to_s end
      request_parameter :offset do |v| v.to_i.to_s end
      request_parameter :filter
      request_parameter :status

      def initialize options={}
        super(options)
        self.limit = options[:limit] if options.has_key?(:limit)
        self.offset = options[:offset] if options.has_key?(:offset)
        self.filter = options[:filter] if options.has_key?(:filter)
        self.status = options[:status] if options.has_key?(:status)
      end
    end
  end
end

