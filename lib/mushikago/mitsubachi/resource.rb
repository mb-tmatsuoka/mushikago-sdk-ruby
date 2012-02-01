# -*- coding : utf-8 -*-
module Mushikago
  module Mitsubachi
    class Resource
      attr_reader :client
      attr_reader :project_name
      attr_reader :resource_name

      def initialize client, project_name, resource_name
        @client = client
        @project_name = project_name
        @resource_name = resource_name
      end

      def body
        client.resource_get(project_name, resource_name, :with_body => true)['body']
      end

      def push url, script_name, file_key, options={}
        client.http_push(project_name, url, script_name, resource_name, file_key, options)
      end

      def to_s
        "#{project_name}:#{resource_name}"
      end
    end
  end
end



