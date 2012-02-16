# -*- coding : utf-8 -*-
module Mushikago
  module Hotaru
    class CollocationGetRequest < Mushikago::Http::GetRequest
      def path; '/1/hotaru/collocation/get' end
      request_parameter :domain_name
      request_parameter :collocation_id
      request_parameter :word

      def initialize domain_name, collocation_id, word, options={}
        super(options)
        self.domain_name = domain_name
        self.collocation_id = collocation_id
        self.word = word
      end
    end
  end
end
