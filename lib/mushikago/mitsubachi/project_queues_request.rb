# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    class ProjectQueuesRequest < Mushikago::Http::GetRequest
      def path; '/1/mitsubachi/project/queues' end
      request_parameter :project_name

      def initialize project_name, options={}
        super(options)
        self.project_name = project_name
      end
    end
  end
end


