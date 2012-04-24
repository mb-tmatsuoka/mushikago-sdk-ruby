# -*- coding : utf-8 -*-
module Mushikago
  module Ponz
    autoload :Client, 'mushikago/ponz/client'

    autoload :CreateDomainRequest, 'mushikago/ponz/create_domain_request'
    autoload :DeleteDomainRequest, 'mushikago/ponz/delete_domain_request'
    autoload :RequestAnalysisRequest, 'mushikago/ponz/request_analysis_request'
    autoload :GetAnalysisRequest, 'mushikago/ponz/get_analysis_request'
    autoload :GetQueueSizeRequest, 'mushikago/ponz/get_queue_size_request'
    autoload :GetInformationRequest, 'mushikago/ponz/get_information_request'
    autoload :GetListDomainsRequest, 'mushikago/ponz/get_list_domains_request'

    autoload :Field, 'mushikago/ponz/field'
  end
end

