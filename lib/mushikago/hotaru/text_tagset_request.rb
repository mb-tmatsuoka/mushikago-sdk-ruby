# -*- coding : utf-8 -*-
module Mushikago
  module Hotaru
    class TextTagsetRequest < Mushikago::Http::PostRequest
      def path; '/1/hotaru/text/tagset' end
      request_parameter :domain_name
      request_parameter :text_id
      request_parameter :tags do |v| [v].flatten.compact.join(',') end
      request_parameter :replace, :default=>false do |v| (v ? 1 : 0).to_s end

      def initialize domain_name, text_id, tags, options={}
        super(options)
        self.domain_name = domain_name
        self.text_id = text_id
        self.tags = tags
        self.replace = options[:replace]
      end
    end
  end
end
