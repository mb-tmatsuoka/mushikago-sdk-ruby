# -*- coding: utf-8 -*-
module Mushikago
  module Hotaru
    # Hotaruサービスを利用する
    #
    # @example
    #   client = Mushikago::Hotaru::Client.new(:api_key => '<api_key>', :secret_key => '<secret_key>')
    #
    #   client.capture('http://www.hotaru.ne.jp/', :thumbnail => true, :tags => ['hotaru', 'webservice'])
    #
    #   captures = client.captures
    #   captures['images'].each do |image|
    #     puts image['image_url']
    #   end
    #
    # @example APIキーをファイルから読み込む場合
    #   Mushikago.config.load(YAML.load(File.read('config.yml')))
    #   client = Mushikago::Hotaru::Client.new
    class Client < Mushikago::Http::Client
      # ドメインを作成する
      #
      # @param [String] domain_name ドメイン名
      # @param [String] splitter スプリッター
      # @param [Hash] options リクエストのオプション
      # @option options [String] :description ドメインの説明
      # @option options [String,Array] :dictionary_ids ユーザ辞書のID
      # @example
      #   client.domain_create('sample_domain', '2gram')
      # @return [Mushikago::Http::Response] リクエストの結果
      def domain_create domain_name, splitter, options={}
        request = Hotaru::DomainCreateRequest.new(domain_name, splitter, options)
        send_request(request)
      end
    end
  end
end
