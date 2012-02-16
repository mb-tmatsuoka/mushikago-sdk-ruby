# -*- coding: utf-8 -*-
require 'net/http'
require 'cgi'
module Mushikago
  module Http
    # MushikagoサービスのHTTPリクエストを表すクラス
    class Request
      # @return [Hash] headers
      attr_reader :headers
      # @return [String] host 
      attr_accessor :host
      # @return [Integer] port 
      attr_accessor :port
      # @return [String] path
      attr_accessor :path
      # @return [String] params
      attr_reader :params

      def initialize options={}
        @headers = {}
        endpoint = options[:endpoint] || Mushikago.config.endpoint
        host, port = endpoint.split(':')
        @host = host
        @port = port
        @path = '/'
        @params = {}
      end

      # @param [String] key パラメータのキー
      # @param [String] value パラメータの値
      def []= key, value
        params[key] = value
      end

      # @param [String] key パラメータのキー
      # @return [String] パラメータの値
      def [] key
        param = params.detect{|p| p[0] == key}
        param ? param[1] : nil
      end

      # @return [String] URLエンコードされ、&で接続されたパラメータの文字列
      def url_encoded_params
        params.sort.select{|p| p[1].kind_of?(String)}.collect{|pp| pp.map{|p| encode p}.join('=')}.join('&')
      end

      # HTTPリクエストオブジェクトに変換する
      # @return [Net::HTTPRequest] HTTPリクエスト
      def to_http_request
        http_request = new_http_request
        headers.each do |key, value|
          http_request[key] = value
        end
        http_request.body = url_encoded_params if http_request.request_body_permitted?
        return http_request
      end

      # @private
      # @return [Net::HTTPRequest] HTTPリクエスト
      protected
      def new_http_request
        new_http_get_request("#{path}?#{url_encoded_params}")
      end

      # URLエンコードされた文字列を取得する
      # @private
      # @param [String] s URLエンコード対象の文字列
      # @return [String] URLエンコードされた文字列
      private
      def encode s
        CGI.escape(s).gsub('+', '%20')
      end

      private
      def new_http_get_request(request_path)
        Net::HTTP::Get.new(request_path)
      end

      private
      def new_http_post_request(request_path)
        Net::HTTP::Post.new(request_path)
      end

      private
      def new_http_put_request(request_path)
        Net::HTTP::Put.new(request_path)
      end

      private
      def new_http_delete_request(request_path)
        Net::HTTP::Delete.new(request_path)
      end

      class << self
        # リクエストパラメータへのアクセサを定義する
        # @param [String] name パラメータ名
        # @yield [value] アクセサを通して渡された値を変換するブロック
        # @yieldreturn [Object] 変換された値
        # @example
        #   add_param :price do |v| v.to_i end
        def add_param name, options={}, &transform
          attr_accessor name
          define_method("#{name}=") do |value|
            value = value || options[:default]
            value = transform ? transform.call(value) : value
            self[name.to_s] = value
            instance_variable_set("@#{name}".to_sym, value)
          end
        end
        alias request_parameter add_param
      end
    end
  end
end

