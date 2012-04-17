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
      
      # 解析リクエストを送信する
      #
      # @example
      #   client.request_analysis('ec', 'http://shop.example.com/')
      #
      # @param [String] domain_name ドメイン名
      # @param [String] url 解析対象URL
      # @param [Hash] options オプション
      # @option options [String] :charset 解析対象ページ文字コード
      # @option options [String] :tag 解析結果検索用タグ
      def request_analysis domain_name, url, options={}
        request = Ponz::RequestAnalysisRequest.new(domain_name, url, options)
        send_request(request)
      end

      # 解析結果を取得する
      #
      # @example
      #    client.get_analysis('ec', 'xxxxxx-xxxxxx-xxxxxx')
      #
      # @param [String] domain_name ドメイン名
      # @param [String] request_id 解析リクエストID
      # @param [Hash] options リクエストのオプション
      # @return [Mushikago::Http::Response] リクエストの結果
      def get_analysis domain_name, request_id, options={}
        request = Ponz::GetAnalysisRequest.new(domain_name, request_id, options)
        send_request(request)
      end

      # ドメイン内の残タスク数を取得する
      #
      # @example
      #    ret = client.get_queue_size('ec')
      #    puts ret['queue_size']
      #
      # @param [String] domain_name ドメイン名
      # @param [Hash] options リクエストのオプション
      # @return [Mushikago::Http::Response] リクエストの結果
      def get_queue_size domain_name, options={}
        request = Ponz::GetQueueSizeRequest.new(domain_name, options)
        send_request(request)
      end
    end
  end
end
