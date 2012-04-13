# -*- coding : utf-8 -*-
module Mushikago
  module Ponz
    class RequestAnalysisRequest < Mushikago::Http::PutRequest
      def path; "/1/ponz/domains/#{domain_name}/analysis" end
      attr_accessor :domain_name
      request_parameter :url
      request_parameter :charset
      request_parameter :tag

      def initialize domain_name, url, options={}
        super(options)
        self.domain_name = domain_name
        self.url = url
        self.charset = options[:charset] if options.has_key?(:charset)
        self.tag = options[:tag] if options.has_key?(:tag)
      end
    end
  end
end
