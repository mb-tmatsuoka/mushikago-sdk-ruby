# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    class ResourceDeleteRequest < Mushikago::Http::DeleteRequest
      def path; '/1/mitsubachi/resource/delete' end
      request_parameter :project_name
      request_parameter :file_name

      def initialize project_name, file_name, options={}
        super(options)
        self.project_name = project_name
        self.file_name = file_name
      end
    end
  end
end




