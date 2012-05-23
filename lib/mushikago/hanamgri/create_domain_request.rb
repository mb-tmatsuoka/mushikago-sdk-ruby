# -*- coding : utf-8 -*-
module Mushikago
  module Hanamgri
    class CreateDomainRequest < Mushikago::Http::PutRequest
      def path; "/1/hanamgri/domains/#{domain_name}" end
      attr_accessor :domain_name
      request_parameter :seeds
      request_parameter :schema do |s| s.to_json end
      request_parameter :dictionary_name
      request_parameter :description

      def initialize domain_name, seeds, schema, options={}
        super(options)
        raise unless schema.kind_of? Mushikago::Hanamgri::Schema
        self.domain_name = domain_name
        self.seeds = seeds
        self.schema = schema
        self.description = options[:description] if options.has_key?(:description)
        self.dictionary_name = options[:dictionary_name] if options.has_key?(:dictionary_name)
      end
    end
  end
end


