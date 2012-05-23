# -*- coding: utf-8 -*-
module Mushikago
  module Hanamgri
    class GetQueueSizeRequest < Mushikago::Http::GetRequest
      def path; "/1/hanamgri/domains/#{domain_name}/queues" end
      attr_accessor :domain_name
      
      def initialize domain_name, options={}
        super(options)
        self.domain_name = domain_name
      end
    end
  end
end
