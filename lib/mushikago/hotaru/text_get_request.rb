# -*- coding : utf-8 -*-
module Mushikago
  module Hotaru
    class TextGetRequest < Mushikago::Http::GetRequest
      def path; '/1/hotaru/text/get' end
      request_parameter :domain_name
      request_parameter :text_id

      def initialize domain_name, text_id, options={}
        super(options)
        self.domain_name = domain_name
        self.text_id = text_id
      end
    end
  end
end
