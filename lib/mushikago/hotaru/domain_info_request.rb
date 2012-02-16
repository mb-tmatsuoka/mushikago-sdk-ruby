# -*- coding: utf-8 -*-
module Mushikago
  module Hotaru
    class DomainInfoRequest < Mushikago::Http::GetRequest
      def path; '/1/hotaru/domain/info' end
      request_parameter :domain_name
      request_parameter :time do |v| v.to_i end

      def initialize domain_name, options={}
        super(options)
        self.domain_name = domain_name
        self.time = options[:time] if options.has_key?(:time)
      end
    end
  end
end




