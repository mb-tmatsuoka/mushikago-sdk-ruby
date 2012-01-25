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

      # TODO script/deployの説明
      #
      # @param [String] project_name プロジェクト名
      # @param [String] script_name デプロイ先のファイル名
      # @param [String of File] file_or_file_name デプロイするファイルオブジェクトもしくはファイルパス
      # @param [Hash] options リクエストのオプション
      # @example
      #   client.script_deploy('project01', 'sample.rb', 'sample.rb')
      # @return [Mushikago::Http::Response] リクエストの結果
      def script_deploy project_name, script_name, file_or_file_name, options={}
        request = ScriptDeployRequest.new(project_name, script_name, file_or_file_name, options)
        send_request(request)
      end

    end
  end
end
