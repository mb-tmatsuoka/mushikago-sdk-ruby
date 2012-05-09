# -*- coding: utf-8 -*-
module Mushikago
  module Hanamgri
    class GetAnalysisRequest < Mushikago::Http::GetRequest
      def path; "/1/hanamgri/domains/#{domain_name}/analyses/#{request_id}" end
      attr_accessor :domain_name
      attr_accessor :request_id
      
      def initialize domain_name, request_id, options={}
        super(options)
        self.domain_name = domain_name
        self.request_id = request_id
      end
    end
  end
end