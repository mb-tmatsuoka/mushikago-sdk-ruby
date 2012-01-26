# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    # Mitsubachiのリクエストを表す抽象クラス
    class Request < Mushikago::Http::Request
      include Mushikago::Auth::Signature

      # @param [Hash] options オプション
      # @option options [String] :endpoint('api.mushikago.org') Mitsubachiのエンドポイント
      def initialize options={}
        super()
        endpoint = options[:endpoint] || Mushikago.config.endpoint
        host, port = endpoint.split(':')
        @host = host
        @port = port if port
        @path = "/#{api_version}/mitsubachi/#{method_name}"
      end

      # @private
      private
      def api_version
        1
      end

      # @private
      private
      def method_name
        ''
      end
    end
  end
end
