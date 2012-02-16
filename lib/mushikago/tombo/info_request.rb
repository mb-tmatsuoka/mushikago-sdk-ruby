# -*- coding: utf-8 -*-
module Mushikago
  module Tombo
    # API使用状況取得リクエスト
    class InfoRequest < Mushikago::Http::GetRequest
      def path; '/1/tombo/info' end

      # @param [Hash] options リクエストのオプション 
      def initialize options={}
        super(options)
      end
    end
  end
end
