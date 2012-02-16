# -*- coding : utf-8 -*-
module Mushikago
  module Hotaru
    class CollocationDownloadRequest < Mushikago::Http::GetRequest
      def path; '/1/hotaru/collocation/download' end
      request_parameter :domain_name
      request_parameter :collocation_id

      def initialize domain_name, collocation_id, options={}
        super(options)
        self.domain_name = domain_name
        self.collocation_id = collocation_id
      end
    end
  end
end
