# -*- coding: utf-8 -*-
module Mushikago
  module Tombo
    # API使用状況取得リクエスト
    class InfoRequest < Request
      def method_name; 'info.json' end

      # @param [Hash] options リクエストのオプション 
      def initialize options={}
        super(options)
      end
    end
  end
end
