# -*- coding : utf-8 -*-
module Mushikago
  module Hotaru
    class TextDeleteRequest < Mushikago::Http::DeleteRequest
      def path; '/1/hotaru/text/delete' end
      request_parameter :domain_name
      request_parameter :text_id
      request_parameter :forcedelete, :default=>true do |v| (v ? 1 : 0).to_s end

      def initialize domain_name, text_id, options={}
        super(options)
        self.domain_name = domain_name
        self.text_id = text_id
        self.forcedelete = options[:forcedelete]
      end
    end
  end
end
