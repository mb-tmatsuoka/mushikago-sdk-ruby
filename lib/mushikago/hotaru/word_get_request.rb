# -*- coding : utf-8 -*-
module Mushikago
  module Hotaru
    class WordGetRequest < Mushikago::Http::GetRequest
      def path; '/1/hotaru/word/get' end
      request_parameter :domain_name
      request_parameter :word

      def initialize domain_name, word, options={}
        super(options)
        self.domain_name = domain_name
        self.word = word
      end
    end
  end
end
