# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    class ProjectDiscontinueRequest < Request
      def method_name; 'project/discontinue' end
      request_parameter :project_name

      def initialize project_name, options={}
        super(options)
        self.project_name = project_name
      end

      def new_http_request
        new_http_post_request(path)
      end
    end
  end
end




