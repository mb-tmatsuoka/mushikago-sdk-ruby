# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    class HttpFetchRequest < Mushikago::Http::PostRequest
      def path; '/1/mitsubachi/http/fetch' end
      request_parameter :url
      request_parameter :project_name
      request_parameter :script_name
      request_parameter :method do |v| v.upcase end
      request_parameter :entity_parameter
      request_parameter :follow_redirect do |v| (v ? 1 : 0).to_s end
      request_parameter :parameters
      request_parameter :header_overwrite

      def initialize project_name, url, script_name, options={}
        super(options)
        self.project_name = project_name
        self.url = url
        self.script_name = script_name
        self.method = options[:method] if options.has_key?(:method)
        self.entity_parameter = options[:entity_parameter] if options.has_key?(:entity_parameter)
        self.follow_redirect = options[:follow_redirect] if options.has_key?(:follow_redirect)
        self.parameters = options[:parameters] if options.has_key?(:parameters)
        self.header_overwrite = options[:header_overwrite] if options.has_key?(:header_overwrite)
      end
    end
  end
end

