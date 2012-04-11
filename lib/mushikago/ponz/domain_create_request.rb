# -*- coding : utf-8 -*-
module Mushikago
  module Ponz
    class DomainCreateRequest < Mushikago::Http::PutRequest
      def path; "/1/ponz/domains/#{domain_name}" end
      attr_accessor :domain_name
      request_parameter :seed
      request_parameter :description

      def initialize domain_name, seed, options={}
        super(options)
        self.domain_name = domain_name
        self.seed = seed
        self.description = options[:description] if options.has_key?(:description)
      end
    end
  end
end


