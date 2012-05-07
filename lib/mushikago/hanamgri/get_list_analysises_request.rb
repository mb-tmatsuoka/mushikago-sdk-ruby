# -*- coding : utf-8 -*-
module Mushikago
  module Hanamgri
    class GetListAnalysisesRequest < Mushikago::Http::GetRequest
      def path; "/1/hanamgri/domains/#{domain_name}/analysises" end
      attr_accessor :domain_name
      request_parameter :limit
      request_parameter :offset
      request_parameter :status

      def initialize domain_name, options={}
        super(options)
        self.domain_name = domain_name
        self.limit = options[:limit] if options.has_key?(:limit)
        self.offset = options[:offset] if options.has_key?(:offset)
        self.status = options[:status] if options.has_key?(:status)
      end
    end
  end
end


