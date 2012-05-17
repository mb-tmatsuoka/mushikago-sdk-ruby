# -*- coding : utf-8 -*-
module Mushikago
  module Hanamgri
    class ListKnowledgesRequest < Mushikago::Http::GetRequest
      def path; "/1/hanamgri/knowledges" end
      request_parameter :limit
      request_parameter :offset
      request_parameter :status

      def initialize options={}
        super(options)
        self.limit = options[:limit] if options.has_key?(:limit)
        self.offset = options[:offset] if options.has_key?(:offset)
        self.status = options[:status] if options.has_key?(:status)
      end
    end
  end
end

