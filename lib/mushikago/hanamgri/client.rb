# -*- coding : utf-8 -*-
module Mushikago
  module Hanamgri
    # Hanamgriサービスを利用する
    #
    # @example
    #   client = Mushikago::Hanamgri::Client.new(:api_key => '<api_key>', :secret_key => '<secret_key>')
    #
    # @example APIキーをファイルから読み込む場合
    #   Mushikago.config.load(YAML.load(File.read('config.yml')))
    #   client = Mushikago::Hanamgri::Client.new
    class Client < Mushikago::Http::Client
      # ドメインを新規作成する
      #
      # @example
      #   schema = Mushikago::Hanamgri::Schema.new do
      #     add Mushikago::Hanamgri::Field.new('name', true, :string)
      #     add Mushikago::Hanamgri::Field.new('price', true, :number)
      #     add {:name => 'shipping', :required => true, :type => :number, :knowledge_name => 'mushikago/ec/shipping'} # <= Hashでも追加できます
      #   end
      #   client.create_domain('ec', '税込', schema)
      #
      # @param [String] domain_name ドメイン名
      # @param [String] seeds 初期キーワード
      # @param [String] schema スキーマ
      # @param [Hash] options オプション
      # @option options [String] :description ドメインの説明
      # @option options [String] :dictionary_name 初期辞書
      def create_domain domain_name, seeds, schema, options={}
        request = Hanamgri::CreateDomainRequest.new(domain_name, seeds, schema, options)
        send_request(request)
      end
      
      # ドメインを削除する
      #
      # @example
      #   client.delete_domain('ec')
      #
      # @param [String] domain_name ドメイン名
      # @param [Hash] options オプション
      # @option options [String] :description ドメインの説明
      def delete_domain domain_name, options={}
        request = Hanamgri::DeleteDomainRequest.new(domain_name, options)
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
      # @option options [String] :tag 解析結果識別用タグ
      # @option options [String] :auto_feedback 解析のみ。もしくは解析と学習を行う
      def request_analysis domain_name, url, options={}
        request = Hanamgri::RequestAnalysisRequest.new(domain_name, url, options)
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
        request = Hanamgri::GetAnalysisRequest.new(domain_name, request_id, options)
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
        request = Hanamgri::GetQueueSizeRequest.new(domain_name, options)
        send_request(request)
      end

      # ドメインの情報を取得する
      #
      # @example
      #    client.get_information('ec')
      #
      # @param [String] domain_name ドメイン名
      # @param [Hash] options リクエストのオプション
      # @return [Mushikago::Http::Response] リクエストの結果
      def get_information domain_name, options={}
        request = Hanamgri::GetInformationRequest.new(domain_name, options)
        send_request(request)
      end

      # ドメインの一覧を取得する
      #
      # @example
      #    client.list_domains(20, 10, 'ec')
      #
      # @param [Hash] options リクエストのオプション
      # @option options [Integer] : limit 最大取得件数
      # @option options [Integer] : offset 開始位置
      # @option options [String] : filter 検索文字（先頭一致）
      # @return [Mushikago::Http::Response] リクエストの結果
      def list_domains options={}
        request = Hanamgri::GetListDomainsRequest.new(options)
        send_request(request)
      end

      # ドメインの情報を更新する
      #
      # @example
      #    client.update_domain('ec', 'updateDescription')
      #
      # @param [Hash] options リクエストのオプション
      # @option options [String] : domain_name ドメイン名
      # @option options [String] : description ドメインの説明文
      # @return [Mushikago::Http::Response] リクエストの結果
      def update_domain domain_name, description, options={}
        request = Hanamgri::UpdateDomainRequest.new(domain_name, description, options)
        send_request(request)
      end

      # 解析結果の一覧を取得する
      #
      # @example
      #    client.list_analyses('ec', {:limit => '20', :offset => '5', :status => 'complete'})
      #
      # @param [String] domain_name ドメイン名
      # @param [Hash] options リクエストのオプション
      # @option options [Integer] : limit 最大取得件数
      # @option options [Integer] : offset 開始位置
      # @option options [String] : filter 検索文字
      # @option options [String] : status 解析の状態
      # @return [Mushikago::Http::Response] リクエストの結果
      def list_analyses domain_name, options={}
        request = Hanamgri::GetListAnalysesRequest.new(domain_name, options)
        send_request(request)
      end
      
      # 解析結果を検索する
      #
      # @example
      #    client.search_schema('ec', 'name', 'something', {:limit => '20', :offset => '5'})
      #
      # @param [String] domain_name ドメイン名
      # @param [String] query_key 検索対象のフィールド名
      # @param [String] query_value 検索対象のフィールド値
      # @option options [Integer] : limit 最大取得件数
      # @option options [Integer] : offset 開始位置
      # @return [Mushikagp::Http::Response] リクエストの結果
      def search_schema domain_name, query_key, query_value, options={}
        request = Hanamgri::SearchSchemaRequest.new(domain_name, query_key, query_value, options)
        send_request(request)
      end

      # 解析結果を検索する
      #
      # @example
      #   training_data = Mushikago::Hanamgri::TrainingData.new do
      #     put('name', 'mushikago')
      #   end
      #   client.train('ec', 'http://www.mushikago.org/', training_data)
      #
      # @param [String] domain_name ドメイン名
      # @param [String] url 学習対象のURL
      # @param [Mushikago::Hanamgri::TrainingData] training_data 学習データ
      # @return [Mushikagp::Http::Response] リクエストの結果
      def train domain_name, url, training_data, options={}
        request = Hanamgri::TrainRequest.new(domain_name, url, training_data, options)
        send_request(request)
      end

      # 辞書を保存する
      #
      # @example
      #   client.save_dictionary('ec', {:description => '辞書の説明'})
      #
      # @param [String] domain_name ドメイン名
      # @param [Hash] options オプション
      # @option options [String] :description 辞書の説明
      def save_dictionary domain_name, options={}
        request = Hanamgri::SaveDictionaryRequest.new(domain_name, options)
        send_request(request)
      end

      # 辞書の一覧を取得する
      #
      # @example
      #    client.list_dictionaries(20, 10)
      #
      # @param [Hash] options リクエストのオプション
      # @option options [Integer] : limit 最大取得件数
      # @option options [Integer] : offset 開始位置
      # @return [Mushikago::Http::Response] リクエストの結果
      def list_dictionaries options={}
        request = Hanamgri::ListDictionariesRequest.new(options)
        send_request(request)
      end
      
      # 辞書の情報を削除する
      #
      # @example
      #    client.delete_dictionary('ec-UUID')
      #
      # @param [String] dictionary_name 辞書名
      def delete_dictionary dictionary_name, options={}
        request = Hanamgri::DeleteDictionaryRequest.new(dictionary_name,options)
        send_request(request)
      end

      # 学習データを保存する
      #
      # @example
      #   client.save_knowledge('ec', {:description => '学習データの説明'})
      #
      # @param [String] domain_name ドメイン名
      # @param [Hash] options オプション
      # @option options [String] :description 学習データの説明
      def save_knowledge domain_name, options={}
        request = Hanamgri::SaveKnowledgeRequest.new(domain_name, options)
        send_request(request)
      end

      # 学習データの一覧を取得する
      #
      # @example
      #    client.list_knowledges(20, 10, 'complete')
      #
      # @param [Hash] options リクエストのオプション
      # @option options [Integer] : limit 最大取得件数
      # @option options [Integer] : offset 開始位置
      # @option options [String] : status 学習データ保存の進捗状況
      # @return [Mushikago::Http::Response] リクエストの結果
      def list_knowledges options={}
        request = Hanamgri::ListKnowledgesRequest.new(options)
        send_request(request)
      end
      
      # 学習データの情報を削除する
      #
      # @example
      #    client.delete_knowledge('ec/price-UUID')
      #
      # @param [String] knowledge_name 学習データ名
      def delete_knowledge knowledge_name, options={}
        request = Hanamgri::DeleteKnowledgeRequest.new(knowledge_name,options)
        send_request(request)
      end

    end
  end
end
