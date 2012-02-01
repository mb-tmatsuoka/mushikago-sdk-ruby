# -*- coding : utf-8 -*-
module Mushikago
  module Mitsubachi
    class Resources
      attr_reader :client
      attr_reader :project_name

      def initialize client, project_name
        @client = client
        @project_name = project_name
      end

      def [] resource_name
        Mitsubachi::Resource.new(client, project_name, resource_name)
      end

      def store resource_file, options={}
        client.resource_store(project_name, resource_file, options)
      end

      def list, options={}
        client.resource_list(project_name, options)['files'].map{|p| self[p['name']]}
      end

      def each
        list.each
      end
    end
  end
end


