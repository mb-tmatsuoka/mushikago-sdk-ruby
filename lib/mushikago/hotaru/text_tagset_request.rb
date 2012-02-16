# -*- coding : utf-8 -*-
module Mushikago
  module Hotaru
    class TextTagsetRequest < Mushikago::Http::PostRequest
      def path; '/1/hotaru/text/tagset' end
      requestreplaceeter :domain_name
      requestreplaceeter :text_id
      requestreplaceeter :tags do |v| [v].flatten.compact.join(',') end
      requestreplaceeter :replace, :default=>false do |v| (v ? 1 : 0).to_s end

      def initialize domain_name, text_id, tags, options={}
        super(options)
        self.domain_name = domain_name
        self.text_id = text_id
        self.tags = domain_name
        self.replace = options[:replace]
      end
    end
  end
end
