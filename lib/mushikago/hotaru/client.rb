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

      # ドメインの情報を参照する
      #
      # @param [String] domain_name ドメイン名
      # @param [Hash] options リクエストのオプション
      # @option options [Integer] :time
      # @example
      #   client.domain_info('sample_domain')
      # @return [Mushikago::Http::Response] リクエストの結果
      def domain_info domain_name, options={}
        request = Hotaru::DomainInfoRequest.new(domain_name, options)
        send_request(request)
      end

      # ドメインの一覧を取得する
      #
      # @param [Hash] options リクエストのオプション
      # @option options [Integer] :limit
      # @option options [Integer] :offset
      # @option options [String] :filter
      # @example
      #   client.domain_list
      # @return [Mushikago::Http::Response] リクエストの結果
      def domain_list options={}
        request = Hotaru::DomainListRequest.new(options)
        send_request(request)
      end

      # ドメインを削除する
      #
      # @param [String] domain_name ドメイン名
      # @param [Hash] options リクエストのオプション
      # @example
      #   client.domain_delete 'sample_domain'
      # @return [Mushikago::Http::Response] リクエストの結果
      def domain_delete domain_name, options={}
        request = Hotaru::DomainDeleteRequest.new(domain_name, options)
        send_request(request)
      end

      # 辞書を登録する 
      #
      # @param [String,File] dictionary_file 辞書ファイル
      # @param [Hash] options リクエストのオプション
      # @example
      #   client.dictionary_put 'custom.csv', :dictionary_name => 'mushikago用語'
      # @return [Mushikago::Http::Response] リクエストの結果
      def dictionary_put dictionary_file, options={}
        request = Hotaru::DictionaryPutRequest.new(dictionary_file, options)
        send_request(request)
      end

      # 辞書の一覧を取得する 
      #
      # @param [Hash] options リクエストのオプション
      # @example
      #   client.dictionary_list
      # @return [Mushikago::Http::Response] リクエストの結果
      def dictionary_list options={}
        request = Hotaru::DictionaryListRequest.new(options)
        send_request(request)
      end

      # 指定されたtextにふさわしいtagを返す
      #
      # @param [String] domain_name ドメイン名
      # @param [String] text text
      # @param [Hash] options リクエストのオプション
      # @example
      #   client.classifier_judge
      # @return [Mushikago::Http::Response] リクエストの結果
      def classifier_judge domain_name, text, options={}
        request = Hotaru::ClassifierJudge.new(domain_name, text, options)
        send_request(request)
      end

      # 共起グラフを作成する
      #
      # @param [String] domain_name ドメイン名
      # @param [String,Array] tags タグ
      # @param [Hash] options リクエストのオプション
      # @option options [String,Array] :parts_of_speech 共起を取る単語の品詞
      # @option options [String] :collocation_name 共起グラフにつける名前
      # @option options [String] :lower_threshold 単語の出現数下限
      # @option options [String] :upper_threshold 単語の出現数上限
      # @option options [String] :description 共起グラフの説明
      # @example
      #   client.collocation_create('sample_domain', ['tag1', 'tag2'])
      #   client.collocation_create('sample_domain', 'tag1', :parts_of_speech => Mushikago::Hotaru::CollocationCreateRequest::POS_LARGE)
      # @return [Mushikago::Http::Response] リクエストの結果
      def collocation_create domain_name, tags, options={}
        request = Hotaru::CollocationCreateRequest.new(domain_name, tags, options)
        send_request(request)
      end

      # 共起グラフを削除する
      #
      # @param [String] domain_name ドメイン名
      # @param [String] collocation_id 共起ID
      # @param [Hash] options リクエストのオプション
      # @example
      #   client.collocation_delete('sample_domain', 'c12345')
      # @return [Mushikago::Http::Response] リクエストの結果
      def collocation_delete domain_name, collocation_id, options={}
        request = Hotaru::CollocationDeleteRequest.new(domain_name, collocation_id, options)
        send_request(request)
      end
    end
  end
end
