# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    class ProjectCreateRequest < Mushikago::Http::PostRequest
      def path; '/1/mitsubachi/project/create' end
      request_parameter :project_name
      request_parameter :dedicated, :default=>false do |v| (v ? 1 : 0).to_s end
      request_parameter :max_lead_time do |v| v.to_i.to_s end
      request_parameter :stdout, :default=>true do |v| (v ? 1 : 0).to_s end
      request_parameter :stderr, :default=>true do |v| (v ? 1 : 0).to_s end
      request_parameter :system_log, :default=>true do |v| (v ? 1 : 0).to_s end
      request_parameter :log_prefix

      def initialize project_name, options={}
        super(options)
        self.project_name = project_name
        self.dedicated = options[:dedicated]
        self.max_lead_time = options[:max_lead_time] if options.has_key?(:max_lead_time)
        self.stdout = options[:stdout]
        self.stderr = options[:stderr]
        self.system_log = options[:system_log]
        self.log_prefix = options[:log_prefix] if options.has_key?(:log_prefix)
      end
    end
  end
end


