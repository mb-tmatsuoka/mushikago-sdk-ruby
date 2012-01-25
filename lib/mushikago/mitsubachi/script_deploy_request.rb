# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    class ScriptDeployRequest < MultipartRequest
      def method_name; 'script/deploy' end
      request_parameter :project_name
      request_parameter :script_name
      request_parameter :file

      def initialize project_name, script_name, file_or_file_name, options={}
        super(options)
        self.project_name = project_name
        self.script_name = script_name
        if(file_or_file_name.kind_of?(File))
          self.file = file_or_file_name
        else
          self.file = File.new(file_or_file_name.to_s)
        end
      end

      def new_http_request
        new_http_post_request(path)
      end
    end
  end
end


