# -*- coding: utf-8 -*-
module Mushikago
  module Hotaru
    class DomainDeleteRequest < Mushikago::Http::DeleteRequest
      def path; '/1/hotaru/domain/delete' end
      request_parameter :domain_name

      def initialize domain_name, options={}
        super(options)
        self.domain_name = domain_name
      end
    end
  end
end
