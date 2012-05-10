# -*- coding: utf-8 -*-
module Mushikago
  module Hanamgri
    class SearchSchemaRequest < Mushikago::Http::GetRequest
      def path; "/1/hanamgri/domains/#{domain_name}/schema/search" end
      attr_accessor :domain_name
      attr_accessor :query_key
      attr_accessor :query_value
      
      def initialize domain_name, query_key, query_value, options={}
        super(options)
        self.domain_name = domain_name
        self.query_key = query_key
        self.query_value = query_value
      end
    end
  end
end