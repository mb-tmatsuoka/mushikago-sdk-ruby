# -*- coding: utf-8 -*-
module Mushikago
  module Hotaru
    class TextListRequest < Mushikago::Http::GetRequest
      def path; '/1/hotaru/text/list' end
      request_parameter :domain_name
      request_parameter :limit do |v| v.to_i.to_s end
      request_parameter :offset do |v| v.to_i.to_s end
      request_parameter :filter
      request_parameter :tags do |v| [v].flatten.compact.join(',') end
      request_parameter :status

      def initialize domain_name, options={}
        super(options)
        self.domain_name = domain_name
        self.limit = options[:limit] if options.has_key?(:limit)
        self.offset = options[:offset] if options.has_key?(:offset)
        self.filter = options[:filter] if options.has_key?(:filter)
        self.tags = options[:tags] if options.has_key?(:tags)
        self.status = options[:status] if options.has_key?(:status)
      end
    end
  end
end

