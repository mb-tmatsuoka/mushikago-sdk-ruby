# -*- coding : utf-8 -*-
module Mushikago
  module Hotaru
    class TagListRequest < Mushikago::Http::GetRequest
      def path; '/1/hotaru/tag/list' end
      request_parameter :domain_name
      request_parameter :filter

      def initialize domain_name, options={}
        super(options)
        self.domain_name = domain_name
        self.filter = options[:filter] if options.has_key?(:filter)
      end
    end
  end
end
