# -*- coding : utf-8 -*-
module Mushikago
  module Mitsubachi
    class Script
      attr_reader :client
      attr_reader :project_name
      attr_reader :script_name

      def initialize client, project_name, script_name
        @client = client
        @project_name = project_name
        @script_name = script_name
      end

      def body
        client.script_get(project_name, script_name, :with_body => true)['body']
      end

      def run url, options={}
        client.http_fetch(project_name, url, script_name, options)
      end

      def to_s
        "#{project_name}:#{script_name}"
      end
    end
  end
end


