# -*- coding : utf-8 -*-
module Mushikago
  module Hanamgri
    class GetListAnalysesRequest < Mushikago::Http::GetRequest
      def path; "/1/hanamgri/domains/#{domain_name}/analyses" end
      attr_accessor :domain_name
      request_parameter :limit
      request_parameter :offset
      request_parameter :filter
      request_parameter :status

      def initialize domain_name, options={}
        super(options)
        self.domain_name = domain_name
        self.limit = options[:limit] if options.has_key?(:limit)
        self.offset = options[:offset] if options.has_key?(:offset)
        self.filter = options[:filter] if options.has_key?(:filter)
        self.status = options[:status] if options.has_key?(:status)
      end
    end
  end
end


