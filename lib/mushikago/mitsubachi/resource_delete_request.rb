# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    class ResourceDeleteRequest < Request
      def method_name; 'resource/delete' end
      request_parameter :project_name
      request_parameter :file_name

      def initialize project_name, file_name, options={}
        super(options)
        self.project_name = project_name
        self.file_name = file_name
      end

      def new_http_request
        new_http_delete_request("#{path}?#{url_encoded_params}")
      end
    end
  end
end




