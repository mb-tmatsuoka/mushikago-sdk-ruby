# -*- coding: utf-8 -*-
module Mushikago
  module Hotaru
    class DictionaryListRequest < Mushikago::Http::GetRequest
      def path; '/1/hotaru/dictionary/list' end
      request_parameter :limit do |v| v.to_i.to_s end
      request_parameter :offset do |v| v.to_i.to_s end
      request_parameter :filter

      def initialize options={}
        super(options)
        self.limit = options[:limit] if options.has_key?(:limit)
        self.offset = options[:offset] if options.has_key?(:offset)
        self.filter = options[:filter] if options.has_key?(:filter)
      end
    end
  end
end





