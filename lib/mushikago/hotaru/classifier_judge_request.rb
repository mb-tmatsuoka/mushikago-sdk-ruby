# -*- coding : utf-8 -*-
module Mushikago
  module Hotaru
    class ClassifierJudgeRequest < Mushikago::Http::GetRequest
      def path; '/1/hotaru/classifier/judge' end
      request_parameter :domain_name

      def initialize domain_name, options={}
        super(options)
        self.domain_name = domain_name
#        self._param = options[:_param] if options.has_key?(:_param)
      end
    end
  end
end
