# -*- coding : utf-8 -*-
module Mushikago
  module Ponz
    # Ponzサービスを利用する
    #
    # @example
    #   client = Mushikago::Ponz::Client.new(:api_key => '<api_key>', :secret_key => '<secret_key>')
    #
    # @example APIキーをファイルから読み込む場合
    #   Mushikago.config.load(YAML.load(File.read('config.yml')))
    #   client = Mushikago::Ponz::Client.new
    class Client < Mushikago::Http::Client
      # ドメインを新規作成する
      #
      # @example
      #   client.create_domain('ec', '税込')
      #
      # @param [String] domain_name ドメイン名
      # @param [String] seed 初期キーワード
      # @param [Hash] options オプション
      # @option options [String] :description ドメインの説明
      def create_domain domain_name, seed, options={}
        request = Ponz::CreateDomainRequest.new(domain_name, seed, options)
        send_request(request)
      end
    end
  end
end
