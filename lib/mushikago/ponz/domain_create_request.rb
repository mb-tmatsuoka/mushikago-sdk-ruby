# -*- coding : utf-8 -*-
module Mushikago
  module Ponz
    class DomainCreateRequest < Mushikago::Http::PostRequest
      def path; '/1/ponz/domain/create' end
      request_parameter :domain_name
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


