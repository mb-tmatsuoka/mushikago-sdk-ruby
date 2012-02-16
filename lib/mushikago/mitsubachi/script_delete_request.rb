# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    class ScriptDeleteRequest < Mushikago::Http::DeleteRequest
      def path; '/1/mitsubachi/script/delete' end
      request_parameter :project_name
      request_parameter :script_name

      def initialize project_name, script_name, options={}
        super(options)
        self.project_name = project_name
        self.script_name = script_name
      end
    end
  end
end



