# -*- coding: utf-8 -*-
module Mushikago
  module Hotaru
    class DomainDeleteRequest < Request
      def method_name; 'domain/delete' end
      request_parameter :domain_name

      def initialize domain_name, options={}
        super(options)
        self.domain_name = domain_name
      end

      def new_http_request
        new_http_delete_request("#{path}?#{url_encoded_params}")
      end
    end
  end
end
