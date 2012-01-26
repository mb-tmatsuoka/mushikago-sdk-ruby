# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    class HttpPushRequest < Request
      def method_name; 'http/fetch.json' end
      request_parameter :url
      request_parameter :project_name
      request_parameter :script_name
      request_parameter :file_name
      request_parameter :file_input_key
      request_parameter :entity_parameter
      request_parameter :parameters
      request_parameter :header_overwrite
      request_parameter :mime_type

      def initialize project_name, url, script_name, file_name, file_input_key, options={}
        super(options)
        self.project_name = project_name
        self.url = url
        self.script_name = script_name
        self.file_name = file_name
        self.file_input_key = file_input_key
        self.entity_parameter = options[:entity_parameter] if options.has_key?(:entity_parameter)
        self.parameters = options[:parameters] if options.has_key?(:parameters)
        self.header_overwrite = options[:header_overwrite] if options.has_key?(:header_overwrite)
        self.mime_type = options[:mime_type] if options.has_key?(:mime_type)
      end

      def new_http_request
        new_http_post_request(path)
      end
    end
  end
end


