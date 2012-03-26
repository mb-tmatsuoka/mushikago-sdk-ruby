# -*- coding: utf-8 -*-
module Mushikago
  module Tombo
    # Tomboサービスを利用する
    #
    # @example
    #   client = Mushikago::Tombo::Client.new(:api_key => '<api_key>', :secret_key => '<secret_key>')
    #
    #   client.capture('http://www.tombo.ne.jp/', :thumbnail => true, :tags => ['tombo', 'webservice'])
    #
    #   captures = client.captures
    #   captures['images'].each do |image|
    #     puts image['image_url']
    #   end
    #
    # @example APIキーをファイルから読み込む場合
    #   Mushikago.config.load(YAML.load(File.read('config.yml')))
    #   client = Mushikago::Tombo::Client.new
    class Client < Mushikago::Http::Client
      # 指定したURLのキャプチャを取得する
      #
      # @param [String] url キャプチャ対象のURL
      # @param [Hash] options リクエストのオプション
      # @option options [String] :image_format('jpg') 画像のフォーマット(jpg,png)
      # @option options [Integer] :image_quality(80) 画像の品質(0-100)
      # @option options [Boolean] :thumbnail(0) サムネイル取得フラグ(false:取得しない,true:取得する)
      # @option options [String,Array] :tags タグ
      # @option options [Integer] :delay_time キャプチャ取得までの遅延時間(0-20000)[ミリ秒]
      # @example
      #   client.capture('http://www.tombo.ne.jp/', :thumbnail => true, :tags => ['tombo', 'webservice'])
      # @return [Mushikago::Http::Response] リクエストの結果
      def capture url, options={}
        request = CaptureRequest.new(url, options)
        send_request(request)
      end

      # いままでキャプチャした画像の情報を取得する
      #
      # @param [Hash] options リクエストのオプション
      # @option options [String] :id 画像のID
      # @option options [String] :domain 指定したドメインの画像一覧を取得する
      # @option options [String] :tag 指定したタグの画像一覧を取得する
      # @option options [Integer] :limit(10) 最大取得件数(1-100)
      # @option options [Integer] :offset(0) 取得オフセット
      # @example
      #   client.captures(:tag => 'webservice')
      # @return [Mushikago::Http::Response] リクエストの結果
      def captures options={}
        request = CapturesRequest.new(options)
        send_request(request)
      end

      # 指定した画像を削除する
      #
      # @param [String] id 画像のID
      # @param [Hash] options リクエストのオプション
      # @example
      #   client.delete('5a6cdfa3-xxx3-47d6-8xxx-5f83af6b66cc')
      # @return [Mushikago::Http::Response] リクエストの結果
      def delete id, options={}
        request = DeleteRequest.new(id, options)
        send_request(request)
      end

      # APIの使用状況を取得する
      #
      # @param [Hash] options リクエストのオプション
      # @example
      #   client.info
      # @return [Mushikago::Http::Response] リクエストの結果
      def info options={}
        request = InfoRequest.new(options)
        send_request(request)
      end
    end
  end
end
