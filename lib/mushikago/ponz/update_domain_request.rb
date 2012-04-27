# -*- coding : utf-8 -*-
module Mushikago
  module Ponz
    class UpdateDomainRequest < Mushikago::Http::PostRequest
      def path; "/1/ponz/domains/#{domain_name}" end
      attr_accessor :domain_name
      attr_accessor :description

      def initialize domain_name, description, options={}
        super(options)
        self.domain_name = domain_name
        self.description = description
      end
    end
  end
end


