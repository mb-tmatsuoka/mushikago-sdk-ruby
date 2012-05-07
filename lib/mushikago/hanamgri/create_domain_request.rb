# -*- coding : utf-8 -*-
module Mushikago
  module Hanamgri
    class CreateDomainRequest < Mushikago::Http::PutRequest
      def path; "/1/hanamgri/domains/#{domain_name}" end
      attr_accessor :domain_name
      request_parameter :seed
      request_parameter :schema do |s| s.to_json end
      request_parameter :description

      def initialize domain_name, seed, schema, options={}
        super(options)
        raise unless schema.kind_of? Mushikago::Hanamgri::Schema
        self.domain_name = domain_name
        self.seed = seed
        self.schema = schema
        self.description = options[:description] if options.has_key?(:description)
      end
    end
  end
end


