# -*- coding : utf-8 -*-
module Mushikago
  module Mitsubachi
    class Project
      attr_reader :client
      attr_reader :project_name

      def initialize client, project_name
        @client = client
        @project_name = project_name
      end

      def resources
        Resources.new(client, project_name)
      end

      def scripts
        Scripts.new(client, project_name)
      end

      def queues options={}
        client.project_queues(project_name, options)['count']
      end

      def info options={}
        client.project_info(project_name, options)
      end

      def delete options={}
        client.project_delete(project_name, options)
      end

      def update options={}
        client.project_update(project_name, options)
      end

      def discontinue options={}
        client.project_discontinue(project_name, options)
      end

      def to_s
        project_name
      end
    end
  end
end

