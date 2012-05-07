# -*- coding : utf-8 -*-
module Mushikago
  module Hanamgri
    class GetListDomainsRequest < Mushikago::Http::GetRequest
      def path; "/1/hanamgri/domains" end
      request_parameter :limit
      request_parameter :offset
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


