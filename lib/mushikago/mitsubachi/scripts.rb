# -*- coding : utf-8 -*-
module Mushikago
  module Mitsubachi
    class Scripts
      attr_reader :client
      attr_reader :project_name

      def initialize client, project_name
        @client = client
        @project_name = project_name
      end

      def [] script_name
        Mitsubachi::Script.new(client, project_name, script_name)
      end

      def deploy script_file, options={}
        client.script_deploy(project_name, script_file, options)
      end

      def list
        client.script_list(project_name)['scripts'].map{|p| self[p['name']]}
      end

      def each
        list.each
      end
    end
  end
end

