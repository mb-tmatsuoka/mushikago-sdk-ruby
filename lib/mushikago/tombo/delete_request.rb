# -*- coding: utf-8 -*-
module Mushikago
  module Tombo
    # Deleteリクエスト
    class DeleteRequest < Mushikago::Http::DeleteRequest
      def path; '/1/tombo/delete' end

      request_parameter :id

      # @param [String] id 画像のID
      # @param [Hash] options リクエストのオプション
      def initialize id, options={}
        super(options)
        self.id = id
      end
    end
  end
end

