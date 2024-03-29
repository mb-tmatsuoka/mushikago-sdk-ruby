# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    class ScriptListRequest < Mushikago::Http::GetRequest
      def path; '/1/mitsubachi/script/list' end
      request_parameter :project_name
      request_parameter :limit do |v| v.to_i.to_s end
      request_parameter :offset do |v| v.to_i.to_s end
      request_parameter :filter

      def initialize project_name, options={}
        super(options)
        self.project_name = project_name
        self.limit = options[:limit] if options.has_key?(:limit)
        self.offset = options[:offset] if options.has_key?(:offset)
        self.filter = options[:filter] if options.has_key?(:filter)
      end
    end
  end
end

