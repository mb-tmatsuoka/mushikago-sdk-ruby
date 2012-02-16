# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    class ScriptDeployRequest < Mushikago::Http::MultipartPostRequest
      def path; '/1/mitsubachi/script/deploy' end
      request_parameter :project_name
      request_parameter :file
      request_parameter :script_name

      def initialize project_name, file_or_file_name, options={}
        super(options)
        self.project_name = project_name
        if(file_or_file_name.kind_of?(File))
          self.file = file_or_file_name
        else
          self.file = File.new(file_or_file_name.to_s)
        end
        self.script_name = options[:script_name] || file.path
      end
    end
  end
end


