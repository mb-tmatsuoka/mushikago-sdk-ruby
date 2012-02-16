# -*- coding: utf-8 -*-
require 'net/http'
require 'json'
module Mushikago
  module Http
    # Mushikagoサービスに接続するクライアント
    class Client
      # @return [String] api_key
      attr_reader :api_key

      # @return [Signer] signer
      attr_reader :signer

      # @return [Boolean] use_ssl
      attr_reader :use_ssl

      # @param [Hash] options
      # @option options [String] :api_key(Configured value) APIキー
      # @option options [String] :secret_key(Configured value) 秘密鍵
      def initialize options={}
        @api_key = (options[:api_key] || Mushikago.config.api_key).to_s
        @signer = Mushikago::Auth::Signer.new((options[:secret_key] || Mushikago.config.secret_key).to_s)
        @use_ssl = options.has_key?(:use_ssl) ? options[:use_ssl] : Mushikago.config.use_ssl
      end

      # @param [Mushikago::Http::Request] request
      # @return [Mushikago::Http::Response] response
      def send_request request
        # add authorization
        request['api_key'] = api_key
        request['timestamp'] = Time.now.utc.strftime('%Y-%m-%dT%H:%M:%SZ')
        request.add_signature!(signer)

        # send request
        Net::HTTP.start(request.host, request.port, :use_ssl => use_ssl) do |http|
          http_request = request.to_http_request
          http_response = http.request(http_request)
          return Mushikago::Http::Response.new(JSON.parse(http_response.body))
        end
      end
    end
  end
end
