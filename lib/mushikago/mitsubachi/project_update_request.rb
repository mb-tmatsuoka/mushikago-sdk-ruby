# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    class ProjectUpdateRequest < Request
      def method_name; 'project/update' end
      request_parameter :project_name
      request_parameter :max_lead_time do |v| v.to_i.to_s end
      request_parameter :stdout do |v| (v ? 1 : 0).to_s end
      request_parameter :stderr do |v| (v ? 1 : 0).to_s end
      request_parameter :system_log do |v| (v ? 1 : 0).to_s end
      request_parameter :log_prefix

      def initialize project_name, options={}
        super(options)
        self.project_name = project_name
        self.dedicated = options[:dedicated] if options.has_key?(:dedicated)
        self.stdout = options[:stdout] if options.has_key?(:stdout)
        self.stderr = options[:stderr] if options.has_key?(:stderr)
        self.system_log = options[:system_log] if options.has_key?(:system_log)
        self.log_prefix = options[:log_prefix] if options.has_key?(:log_prefix)
      end

      def new_http_request
        new_http_post_request(path)
      end
    end
  end
end



