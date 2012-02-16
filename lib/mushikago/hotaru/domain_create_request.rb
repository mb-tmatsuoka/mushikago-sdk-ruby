# -*- coding: utf-8 -*-
module Mushikago
  module Hotaru
    class DomainCreateRequest < Request
      def method_name; 'domain/create' end
      request_parameter :domain_name
      request_parameter :splitter
      request_parameter :description
      request_parameter :dictionary_ids do |v| [v].flatten.compact.join(',') end

      def initialize domain_name, splitter, options={}
        super(options)
        self.domain_name = domain_name
        self.splitter = splitter
        self.description = options[:description] if options.has_key?(:description)
        self.dictionary_ids = options[:dictionary_ids] if options.has_key?(:dictionary_ids)
      end

      def new_http_request
        new_http_post_request(path)
      end
    end
  end
end

