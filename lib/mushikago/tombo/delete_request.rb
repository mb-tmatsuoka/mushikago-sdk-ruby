# -*- coding: utf-8 -*-
module Mushikago
  module Tombo
    # Deleteリクエスト
    class DeleteRequest < Request
      def method_name; 'delete.json' end

      add_param :id

      # @param [String] id 画像のID
      # @param [Hash] options リクエストのオプション
      def initialize id, options={}
        super(options)
        self.id = id
      end

      # @private
      def new_http_request
        new_http_delete_request("#{path}?#{url_encoded_params}")
      end
    end
  end
end

