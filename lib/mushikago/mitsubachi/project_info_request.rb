# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    class ProjectInfoRequest < Request
      def method_name; 'project/info' end
      request_parameter :project_name
      request_parameter :time do |v| v.to_i.to_s end

      def initialize project_name, options={}
        super(options)
        self.project_name = project_name
        self.time = options[:time] if options.has_key?(:time)
      end
    end
  end
end

