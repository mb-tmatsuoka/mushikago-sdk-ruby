# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    class ScriptGetRequest < Mushikago::Http::GetRequest
      def path; '/1/mitsubachi/script/get' end
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


