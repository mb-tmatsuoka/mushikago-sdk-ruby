# -*- coding : utf-8 -*-
module Mushikago
  module Hanamgri
    class RequestAnalysisRequest < Mushikago::Http::PutRequest
      def path; "/1/hanamgri/domains/#{domain_name}/analysis" end
      attr_accessor :domain_name
      request_parameter :url
      request_parameter :charset
      request_parameter :tag
      request_parameter :auto_feedback
      def initialize domain_name, url, options={}
        super(options)
        self.domain_name = domain_name
        self.url = url
        self.charset = options[:charset] if options.has_key?(:charset)
        self.tag = options[:tag] if options.has_key?(:tag)
        self.tag = options[:auto_feedback] if options.has_key?(:auto_feedback)
      end
    end
  end
end
