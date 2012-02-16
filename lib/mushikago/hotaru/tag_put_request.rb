# -*- coding : utf-8 -*-
module Mushikago
  module Hotaru
    class TagPutRequest < Mushikago::Http::PutRequest
      def path; '/1/hotaru/tag/put' end
      request_parameter :domain_name
      request_parameter :tag

      def initialize domain_name, tag, options={}
        super(options)
        self.domain_name = domain_name
        self.tag = tag
      end
    end
  end
end

