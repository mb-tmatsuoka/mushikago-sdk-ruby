# -*- coding : utf-8 -*-
module Mushikago
  module Hanamgri
    class TrainRequest < Mushikago::Http::PostRequest
      def path; "/1/hanamgri/domains/#{domain_name}/train" end
      attr_accessor :domain_name
      request_parameter :url_or_html
      request_parameter :training_data do |s| s.to_json end
      request_parameter :charset

      def initialize domain_name, url_or_html, training_data, options={}
        super(options)
        raise unless training_data.kind_of? Mushikago::Hanamgri::TrainingData
        self.domain_name = domain_name
        self.url_or_html = url_or_html
        self.training_data = training_data
        self.charset = options[:charset] if options.has_key?(:charset)
      end
    end
  end
end


