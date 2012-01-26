# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    # Mitsubachiサービスを利用する
    #
    # @example
    #   client = Mushikago::Mitsubachi::Client.new(:api_key => '<api_key>', :secret_key => '<secret_key>')
    #
    #   client.project_create('project01')
    #   client.script_deploy('project01', 'sample.rb', 'sample.rb')
    #   client.http_fetch('project01', 'http://www.mushikago.org/', 'sample.rb')
    #
    # @example APIキーをファイルから読み込む場合
    #   Mushikago.config.load(YAML.load(File.read('config.yml')))
    #   client = Mushikago::Mitsubachi::Client.new
    class Client < Mushikago::Http::Client
      # TODO project/createの説明
      #
      # @param [String] project_name プロジェクト名
      # @param [Hash] options リクエストのオプション
      # @example
      #   client.project_create('project01', :stdout => true)
      # @return [Mushikago::Http::Response] リクエストの結果
      def project_create project_name, options={}
        request = ProjectCreateRequest.new(project_name, options)
        send_request(request)
      end

      # TODO project/listの説明
      #
      # @param [Hash] options リクエストのオプション
      # @option options [Integer] :limit
      # @option options [Integer] :offset
      # @option options [String] :filter
      # @example
      #   client.project_list
      # @return [Mushikago::Http::Response] リクエストの結果
      def project_list options={}
        request = ProjectListRequest.new(options)
        send_request(request)
      end

      # TODO project/infoの説明
      #
      # @param [String] project_name プロジェクト名
      # @param [Hash] options リクエストのオプション
      # @example
      #   client.project_info('project01')
      # @return [Mushikago::Http::Response] リクエストの結果
      def project_info project_name, options={}
        request = ProjectInfoRequest.new(project_name, options)
        send_request(request)
      end

      # TODO project/queuesの説明
      #
      # @param [String] project_name プロジェクト名
      # @param [Hash] options リクエストのオプション
      # @example
      #   client.project_queues('project01')
      # @return [Mushikago::Http::Response] リクエストの結果
      def project_queues project_name, options={}
        request = ProjectQueuesRequest.new(project_name, options)
        send_request(request)
      end

      # TODO project/deleteの説明
      #
      # @param [String] project_name プロジェクト名
      # @param [Hash] options リクエストのオプション
      # @example
      #   client.project_delete('project01')
      # @return [Mushikago::Http::Response] リクエストの結果
      def project_delete project_name, options={}
        request = ProjectDeleteRequest.new(project_name, options)
        send_request(request)
      end

      # TODO project/updateの説明
      #
      # @param [String] project_name プロジェクト名
      # @param [Hash] options リクエストのオプション
      # @example
      #   client.project_update('project01', :stdout => false)
      # @return [Mushikago::Http::Response] リクエストの結果
      def project_update project_name, options={}
        request = ProjectUpdateRequest.new(project_name, options)
        send_request(request)
      end

      # TODO project/discontinueの説明
      #
      # @param [String] project_name プロジェクト名
      # @param [Hash] options リクエストのオプション
      # @example
      #   client.project_discontinue('project01')
      # @return [Mushikago::Http::Response] リクエストの結果
      def project_discontinue project_name, options={}
        request = ProjectDiscontinueRequest.new(project_name, options)
        send_request(request)
      end

      # TODO http/fetchの説明
      #
      # @param [String] project_name プロジェクト名
      # @param [String] url クロール対象のURL
      # @param [String] script_name スクレイピングスクリプトのパス
      # @param [Hash] options リクエストのオプション
      # @option options [String] :method('GET') HTTPリクエストメソッド
      # @option options [String] :entity_parameter
      # @option options [Boolean] :follow_redirect
      # @option options [String] :parameters
      # @option options [String] :header_overwrite
      # @example
      #   client.http_fetch('project01', 'http://www.tombo.ne.jp/', 'sample.rb', :follow_redirect => true)
      # @return [Mushikago::Http::Response] リクエストの結果
      def http_fetch project_name, url, script_name, options={}
        request = HttpFetchRequest.new(project_name, url, script_name, options)
        send_request(request)
      end

      # TODO http/pushの説明
      #
      # @param [String] project_name プロジェクト名
      # @param [String] url クロール対象のURL
      # @param [String] script_name スクレイピングスクリプトのパス
      # @param [String] file_name
      # @param [String] file_input_key
      # @param [Hash] options リクエストのオプション
      # @option options [String] :entity_parameter
      # @option options [String] :parameters
      # @option options [String] :header_overwrite
      # @option options [String] :mime_type
      # @example
      #   client.http_push('project01', 'http://www.tombo.ne.jp/', 'sample.rb')
      # @return [Mushikago::Http::Response] リクエストの結果
      def http_push project_name, url, script_name, file_name, file_input_key, options={}
        request = HttpPushRequest.new(project_name, url, script_name, file_name, file_input_key, options)
        send_request(request)
      end

      # TODO script/deployの説明
      #
      # @param [String] project_name プロジェクト名
      # @param [String of File] file_or_file_name デプロイするファイルオブジェクトもしくはファイルパス
      # @param [Hash] options リクエストのオプション
      # @option options [String] script_name デプロイ先のファイル名
      # @example
      #   client.script_deploy('project01', 'sample.rb', :script_name => 'hoge.rb')
      # @return [Mushikago::Http::Response] リクエストの結果
      def script_deploy project_name, file_or_file_name, options={}
        request = ScriptDeployRequest.new(project_name, file_or_file_name, options)
        send_request(request)
      end

      # TODO script/listの説明
      #
      # @param [String] project_name プロジェクト名
      # @param [Hash] options リクエストのオプション
      # @option options [Integer] :limit
      # @option options [Integer] :offset
      # @option options [String] :filter
      # @example
      #   client.script_list('project01')
      # @return [Mushikago::Http::Response] リクエストの結果
      def script_list project_name, options={}
        request = ScriptListRequest.new(project_name, options)
        send_request(request)
      end

      # TODO script/getの説明
      #
      # @param [String] project_name プロジェクト名
      # @param [String] script_name デプロイ先のファイル名
      # @param [Hash] options リクエストのオプション
      # @example
      #   client.script_get('project01', 'sample.rb')
      # @return [Mushikago::Http::Response] リクエストの結果
      def script_get project_name, script_name, options={}
        request = ScriptGetRequest.new(project_name, script_name, options)
        send_request(request)
      end

      # TODO script/deleteの説明
      #
      # @param [String] project_name プロジェクト名
      # @param [String] script_name デプロイ先のファイル名
      # @param [Hash] options リクエストのオプション
      # @example
      #   client.script_delete('project01', 'sample.rb')
      # @return [Mushikago::Http::Response] リクエストの結果
      def script_delete project_name, script_name, options={}
        request = ScriptDeleteRequest.new(project_name, script_name, options)
        send_request(request)
      end

      # TODO resource/storeの説明
      #
      # @param [String] project_name プロジェクト名
      # @param [String of File] file_or_file_name デプロイするファイルオブジェクトもしくはファイルパス
      # @param [Hash] options リクエストのオプション
      # @option options [String] :file_name デプロイ先のファイル名
      # @option options [String] :content_type
      # @option options [public] :public
      # @example
      #   client.resource_store('project01', 'sample.csv',)
      # @return [Mushikago::Http::Response] リクエストの結果
      def resource_store project_name, file_or_file_name, options={}
        request = ResourceStoreRequest.new(project_name, file_or_file_name, options)
        send_request(request)
      end

      # TODO resource/listの説明
      #
      # @param [String] project_name プロジェクト名
      # @param [Hash] options リクエストのオプション
      # @option options [Integer] :limit
      # @option options [Integer] :offset
      # @option options [String] :filter
      # @example
      #   client.resource_list('project01')
      # @return [Mushikago::Http::Response] リクエストの結果
      def resource_list project_name, options={}
        request = ResourceListRequest.new(project_name, options)
        send_request(request)
      end

      # TODO resource/getの説明
      #
      # @param [String] project_name プロジェクト名
      # @param [String] file_name 保存先のファイル名
      # @param [Hash] options リクエストのオプション
      # @example
      #   client.resource_get('project01', 'sample.rb')
      # @return [Mushikago::Http::Response] リクエストの結果
      def resource_get project_name, file_name, options={}
        request = ResourceGetRequest.new(project_name, file_name, options)
        send_request(request)
      end

      # TODO resource/deleteの説明
      #
      # @param [String] project_name プロジェクト名
      # @param [String] file_name 保存先のファイル名
      # @param [Hash] options リクエストのオプション
      # @example
      #   client.resource_delete('project01', 'sample.rb')
      # @return [Mushikago::Http::Response] リクエストの結果
      def resource_delete project_name, file_name, options={}
        request = ResourceDeleteRequest.new(project_name, file_name, options)
        send_request(request)
      end
    end
  end
end

