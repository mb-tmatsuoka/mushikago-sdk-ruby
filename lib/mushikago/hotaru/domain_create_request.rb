# -*- coding: utf-8 -*-
module Mushikago
  module Hotaru
    class DomainCreateRequest < Mushikago::Http::PostRequest
      def path; '/1/hotaru/domain/create' end
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
    end
  end
end

