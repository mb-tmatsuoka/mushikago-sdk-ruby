# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    class ProjectDeleteRequest < Request
      def method_name; 'project/delete' end
      request_parameter :project_name
      request_parameter :forcedelete, :default=>true do |v| (v ? 1 : 0).to_s end

      def initialize project_name, options={}
        super(options)
        self.project_name = project_name
        self.forcedelete = options[:forcedelete]
      end

      def new_http_request
        new_http_delete_request("#{path}?#{url_encoded_params}")
      end
    end
  end
end



