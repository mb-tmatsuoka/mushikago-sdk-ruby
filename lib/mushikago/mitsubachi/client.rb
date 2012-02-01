# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    # mitsubachiサービスを利用する
    #
    # @example
    #   require 'mushikago'
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
      def projects
        Mitsubachi::Projects.new(self)
      end
      # project/createを発行します
      #
      # @param [String] project_name プロジェクト名
      # @param [Hash] options リクエストのオプション
      # @option options [Boolean] :dedicated
      # @option options [Integer] :max_lead_time
      # @option options [Boolean] :stdout
      # @option options [Boolean] :stderr
      # @option options [Boolean] :system_log
      # @option options [String] :log_prefix
      # @example
      #   client.project_create('project01', :stdout => true)
      # @return [Mushikago::Http::Response] リクエストの結果
      def project_create project_name, options={}
        request = ProjectCreateRequest.new(project_name, options)
        send_request(request)
      end

      # project/listを発行します
      #
      # @param [Hash] options リクエストのオプション
      # @option options [Integer] :limit
      # @option options [Integer] :offset
      # @option options [String] :filter
      # @example
      #   result = client.project_list
      #   result['projects'].each do |project|
      #     puts project['name']
      #   end
      # @return [Mushikago::Http::Response] リクエストの結果
      def project_list options={}
        request = ProjectListRequest.new(options)
        send_request(request)
      end

      # project/infoを発行します
      #
      # @param [String] project_name プロジェクト名
      # @param [Hash] options リクエストのオプション
      # @example
      #   result = client.project_info('project01')
      #   puts result['dedicated']
      #   puts result['max_lead_time']
      #   puts result['stdout']
      #   puts result['stderr']
      #   puts result['system_log']
      #   puts result['log_prefix']
      #   puts result['count']
      #   puts result['usage']
      #   puts result['storage_prefix']
      # @return [Mushikago::Http::Response] リクエストの結果
      def project_info project_name, options={}
        request = ProjectInfoRequest.new(project_name, options)
        send_request(request)
      end

      # project/queuesを発行します
      #
      # @param [String] project_name プロジェクト名
      # @param [Hash] options リクエストのオプション
      # @example
      #   result = client.project_queues('project01')
      #   puts result['count']
      # @return [Mushikago::Http::Response] リクエストの結果
      def project_queues project_name, options={}
        request = ProjectQueuesRequest.new(project_name, options)
        send_request(request)
      end

      # project/deleteを発行します
      #
      # @param [String] project_name プロジェクト名
      # @param [Hash] options リクエストのオプション
      # @option options [Boolean] :forcedelete
      # @example
      #   client.project_delete('project01')
      # @return [Mushikago::Http::Response] リクエストの結果
      def project_delete project_name, options={}
        request = ProjectDeleteRequest.new(project_name, options)
        send_request(request)
      end

      # project/updateを発行します
      #
      # @param [String] project_name プロジェクト名
      # @param [Hash] options リクエストのオプション
      # @option options [Integer] :max_lead_time
      # @option options [Boolean] :stdout
      # @option options [Boolean] :stderr
      # @option options [Boolean] :system_log
      # @option options [String] :log_prefix
      # @example
      #   client.project_update('project01', :stdout => false)
      # @return [Mushikago::Http::Response] リクエストの結果
      def project_update project_name, options={}
        request = ProjectUpdateRequest.new(project_name, options)
        send_request(request)
      end

      # project/discontinueを発行します
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

      # http/fetchを発行します
      #
      # @param [String] project_name プロジェクト名
      # @param [String] url クロール対象のURL
      # @param [String] script_name スクレイピングスクリプトのパス
      # @param [Hash] options リクエストのオプション
      # @option options [String] :method
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

      # http/pushを発行します
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

      # script/deployを発行します
      #
      # @param [String] project_name プロジェクト名
      # @param [String or File] file_or_file_name デプロイするファイルオブジェクトもしくはファイルパス
      # @param [Hash] options リクエストのオプション
      # @option options [String] script_name デプロイ先のファイル名
      # @example
      #   client.script_deploy('project01', 'sample.rb', :script_name => 'hoge.rb')
      # @return [Mushikago::Http::Response] リクエストの結果
      def script_deploy project_name, file_or_file_name, options={}
        request = ScriptDeployRequest.new(project_name, file_or_file_name, options)
        send_request(request)
      end

      # script/listを発行します
      #
      # @param [String] project_name プロジェクト名
      # @param [Hash] options リクエストのオプション
      # @option options [Integer] :limit
      # @option options [Integer] :offset
      # @option options [String] :filter
      # @example
      #   limit = 10
      #   offset = 0
      #   has_more_files = 1
      #   until has_more_files == 0
      #     result = client.script_list('project01', :limit => limit, :offset => offset)
      #     result['scripts'].each do |script|
      #       puts script['name']
      #       puts script['size']
      #       puts script['timestamp']
      #     end
      #     offset += limit
      #     has_more_files = result['has_more_files']
      #   end
      # @return [Mushikago::Http::Response] リクエストの結果
      def script_list project_name, options={}
        request = ScriptListRequest.new(project_name, options)
        send_request(request)
      end

      # script/getを発行します
      #
      # @param [String] project_name プロジェクト名
      # @param [String] script_name デプロイ先のファイル名
      # @param [Hash] options リクエストのオプション
      # @option options [Boolean] :with_body trueを指定すると、response['body']でファイルの内容にアクセスすることができるようになります。
      # @example
      #   result = client.script_get('project01', 'sample.rb')
      #   puts result['url']
      # @return [Mushikago::Http::Response] リクエストの結果
      def script_get project_name, script_name, options={}
        request = ScriptGetRequest.new(project_name, script_name, options)
        result = send_request(request)
        if options[:with_body]
          begin
            uri = URI.parse(result['url'])
            result['body'] = Net::HTTP.get(uri.host, uri.request_uri)
          rescue
          end
        end
        return result
      end

      # script/deleteを発行します
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

      # resource/storeを発行します
      #
      # @param [String] project_name プロジェクト名
      # @param [String or File] file_or_file_name デプロイするファイルオブジェクトもしくはファイルパス
      # @param [Hash] options リクエストのオプション
      # @option options [String] :file_name デプロイ先のファイル名
      # @option options [String] :content_type
      # @option options [public] :public
      # @example
      #   client.resource_store('project01', 'sample.csv', :public => true)
      # @return [Mushikago::Http::Response] リクエストの結果
      def resource_store project_name, file_or_file_name, options={}
        request = ResourceStoreRequest.new(project_name, file_or_file_name, options)
        send_request(request)
      end

      # resource/listを発行します
      #
      # @param [String] project_name プロジェクト名
      # @param [Hash] options リクエストのオプション
      # @option options [Integer] :limit
      # @option options [Integer] :offset
      # @option options [String] :filter
      # @example
      #   limit = 10
      #   offset = 0
      #   has_more_files = 1
      #   until has_more_files == 0
      #     result = client.resource_list('project01', :limit => limit, :offset => offset)
      #     result['files'].each do |file|
      #       puts script['name']
      #       puts script['size']
      #       puts script['timestamp']
      #     end
      #     offset += limit
      #     has_more_files = result['has_more_files']
      #   end
      # @return [Mushikago::Http::Response] リクエストの結果
      def resource_list project_name, options={}
        request = ResourceListRequest.new(project_name, options)
        send_request(request)
      end

      # resource/getを発行します
      #
      # @param [String] project_name プロジェクト名
      # @param [String] file_name 保存先のファイル名
      # @param [Hash] options リクエストのオプション
      # @option options [Boolean] :with_body trueを指定すると、response['body']でファイルの内容にアクセスすることができるようになります。
      # @example
      #   result = client.resource_get('project01', 'sample.rb')
      #   puts result['url']
      # @return [Mushikago::Http::Response] リクエストの結果
      def resource_get project_name, file_name, options={}
        request = ResourceGetRequest.new(project_name, file_name, options)
        result = send_request(request)
        if options[:with_body]
          begin
            uri = URI.parse(result['url'])
            result['body'] = Net::HTTP.get(uri.host, uri.request_uri)
          rescue
          end
        end
        return result
      end

      # resource/deleteを発行します
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

