# -*- coding: utf-8 -*-
module Mushikago
  module Http
    # Mushikagoサービスのレスポンスを扱うクラス
    # Mushikagoサービスのレスポンスは以下のような構造になっている
    #   {
    #     meta : {
    #       status : 200,
    #       message : 'OK'
    #     },
    #     response : {
    #       // サービス毎に異なる情報
    #     }
    #   }
    #
    class Response
      # @return [Object] レスポンスのメタ情報
      attr_reader :meta
      # @return [Object] レスポンスの本体
      attr_reader :response
      
      # @param [Hash] options オプション
      # @option options [Object] :meta レスポンスのメタ情報
      # @option options [Object] :response レスポンスの本体
      def initialize options={}
        @meta = options[:meta] || options['meta']
        @response = options[:response] || options['response']
      end

      # メタ情報中のstatusを返す
      # @return [Integer] ステータス
      def status
        meta[:status].to_i
      end

      # メタ情報中のmessageを返す
      # @return [String] メッセージ
      def message
        meta[:message]
      end

      # レスポンスの各要素にアクセスする
      # @param [Symbol] key レスポンスの各要素へのキー
      # @return [Object] レスポンスの要素
      def [] key
        response[key]
      end

      def []= key, value
        response[key] = value
      end

      def to_s
        {
          '@meta' => meta,
          '@response' => response
        }.to_json
      end
    end
  end
end

