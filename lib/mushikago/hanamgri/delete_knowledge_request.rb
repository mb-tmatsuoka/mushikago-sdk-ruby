# -*- coding : utf-8 -*-
module Mushikago
  module Hanamgri
    class DeleteKnowledgeRequest < Mushikago::Http::DeleteRequest
      def path; "/1/hanamgri/knowledge" end
      request_parameter :knowledge_name
      
      def initialize knowledge_name, options={}
        super(options)
        self.knowledge_name = knowledge_name
      end
    end
  end
end
