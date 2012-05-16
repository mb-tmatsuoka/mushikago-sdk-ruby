# -*- coding : utf-8 -*-
module Mushikago
  module Hanamgri
    class SaveDictionaryRequest < Mushikago::Http::PutRequest
      def path; "/1/hanamgri/dictionary" end
      attr_accessor :domain_name
      request_parameter :description

      def initialize domain_name, options={}
        super(options)
        self.domain_name = domain_name
        self.description = options[:description] if options.has_key?(:description)
      end
    end
  end
end


