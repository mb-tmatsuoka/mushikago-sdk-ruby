# -*- coding : utf-8 -*-
module Mushikago
  module Hanamgri
    class TrainRequest < Mushikago::Http::PostRequest
      def path; "/1/hanamgri/domains/#{domain_name}/train" end
      attr_accessor :domain_name
      request_parameter :url
      request_parameter :training_data do |s| s.to_json end

      def initialize domain_name, url, training_data, options={}
        super(options)
        raise unless training_data.kind_of? Mushikago::Hanamgri::TrainingData
        self.domain_name = domain_name
        self.url = url
        self.training_data = training_data
      end
    end
  end
end


