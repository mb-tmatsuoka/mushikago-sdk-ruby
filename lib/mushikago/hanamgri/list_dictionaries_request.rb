# -*- coding : utf-8 -*-
module Mushikago
  module Hanamgri
    class ListDictionariesRequest < Mushikago::Http::GetRequest
      def path; "/1/hanamgri/dictionaries" end
      request_parameter :limit
      request_parameter :offset

      def initialize options={}
        super(options)
        self.limit = options[:limit] if options.has_key?(:limit)
        self.offset = options[:offset] if options.has_key?(:offset)
      end
    end
  end
end

