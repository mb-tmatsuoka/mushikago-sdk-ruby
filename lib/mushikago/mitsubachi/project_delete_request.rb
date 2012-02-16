# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    class ProjectDeleteRequest < Mushikago::Http::DeleteRequest
      def path; '/1/mitsubachi/project/delete' end
      request_parameter :project_name
      request_parameter :forcedelete, :default=>true do |v| (v ? 1 : 0).to_s end

      def initialize project_name, options={}
        super(options)
        self.project_name = project_name
        self.forcedelete = options[:forcedelete]
      end
    end
  end
end



