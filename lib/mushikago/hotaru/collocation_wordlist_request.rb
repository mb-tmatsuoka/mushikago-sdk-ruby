# -*- coding : utf-8 -*-
module Mushikago
  module Hotaru
    class CollocationWordlistRequest < Mushikago::Http::GetRequest
      def path; '/1/hotaru/collocation/wordlist' end
      request_parameter :domain_name
      request_parameter :collocation_id
      request_parameter :limit do |v| v.to_i.to_s end
      request_parameter :offset do |v| v.to_i.to_s end
      request_parameter :filter

      def initialize domain_name, collocation_id, options={}
        super(options)
        self.domain_name = domain_name
        self.collocation_id = collocation_id
        self.limit = options[:limit] if options.has_key?(:limit)
        self.offset = options[:offset] if options.has_key?(:offset)
        self.filter = options[:filter] if options.has_key?(:filter)
      end
    end
  end
end
