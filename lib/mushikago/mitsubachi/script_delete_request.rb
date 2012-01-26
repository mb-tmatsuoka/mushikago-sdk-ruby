# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    class ScriptDeleteRequest < Request
      def method_name; 'script/delete' end
      request_parameter :project_name
      request_parameter :script_name

      def initialize project_name, script_name, options={}
        super(options)
        self.project_name = project_name
        self.script_name = script_name
      end

      def new_http_request
        new_http_delete_request("#{path}?#{url_encoded_params}")
      end
    end
  end
end



