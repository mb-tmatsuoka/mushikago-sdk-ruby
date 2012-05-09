# -*- coding : utf-8 -*-
module Mushikago
  module Hanamgri
    autoload :Client, 'mushikago/hanamgri/client'

    autoload :CreateDomainRequest, 'mushikago/hanamgri/create_domain_request'
    autoload :DeleteDomainRequest, 'mushikago/hanamgri/delete_domain_request'
    autoload :RequestAnalysisRequest, 'mushikago/hanamgri/request_analysis_request'
    autoload :GetAnalysisRequest, 'mushikago/hanamgri/get_analysis_request'
    autoload :GetQueueSizeRequest, 'mushikago/hanamgri/get_queue_size_request'
    autoload :GetInformationRequest, 'mushikago/hanamgri/get_information_request'
    autoload :GetListDomainsRequest, 'mushikago/hanamgri/get_list_domains_request'
    autoload :UpdateDomainRequest, 'mushikago/hanamgri/update_domain_request'
    autoload :GetListAnalysesRequest, 'mushikago/hanamgri/get_list_analyses_request'

    autoload :Schema, 'mushikago/hanamgri/schema'
    autoload :Field, 'mushikago/hanamgri/field'
  end
end

