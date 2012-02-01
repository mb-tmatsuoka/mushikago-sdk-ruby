# -*- coding : utf-8 -*-
module Mushikago
  module Mitsubachi
    class Projects
      attr_reader :client

      def initialize client
        @client = client
      end

      def [] project_name
        Mitsubachi::Project.new(client, project_name)
      end

      def create project_name, options={}
        client.project_create(project_name, options)
      end

      def list
        client.project_list['projects'].map{|p| Mitsubachi.Project.new(client, p['name'])}
      end

      def each
        list.each
      end
    end
  end
end
