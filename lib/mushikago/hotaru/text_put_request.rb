# -*- coding : utf-8 -*-
module Mushikago
  module Hotaru
    class TextPutRequest < Mushikago::Http::PutRequest
      def path; '/1/hotaru/text/put' end
      request_parameter :domain_name
      request_parameter :tags do |v| [v].flatten.compact.join(',') end
      request_parameter :text
      request_parameter :text_name

      def initialize domain_name, text, tags, options={}
        super(options)
        self.domain_name = domain_name
        self.text = text
        self.tags = tags
        self.text_name = options[:text_name] if options.has_key?(:text_name)
      end
    end
  end
end
