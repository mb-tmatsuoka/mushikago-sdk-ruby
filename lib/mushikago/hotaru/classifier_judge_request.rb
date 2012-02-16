# -*- coding : utf-8 -*-
module Mushikago
  module Hotaru
    class ClassifierJudgeRequest < Mushikago::Http::PostRequest
      def path; '/1/hotaru/classifier/judge' end
      request_parameter :domain_name
      request_parameter :text

      def initialize domain_name, text, options={}
        super(options)
        self.domain_name = domain_name
        self.text = text
      end
    end
  end
end
