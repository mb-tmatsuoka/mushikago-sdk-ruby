module Mushikago
  # Hotaruへのアクセスを行うモジュール
  module Hotaru
    autoload :Client, 'mushikago/hotaru/client'
    autoload :Request, 'mushikago/hotaru/request'

    autoload :ListDomainRequest, 'mushikago/hotaru/list_domain_request'
    autoload :CreateDomainRequest, 'mushikago/hotaru/create_domain_request'
    autoload :DeleteDomainRequest, 'mushikago/hotaru/delete_domain_request'

    autoload :ListDocumentRequest, 'mushikago/hotaru/list_document_request'
    autoload :PutDocumentRequest, 'mushikago/hotaru/put_document_request'
    autoload :DeleteDocumentRequest, 'mushikago/hotaru/delete_document_request'

    autoload :ListCollocationRequest, 'mushikago/hotaru/list_collocation_request'
    autoload :BuildCollocationRequest, 'mushikago/hotaru/build_collocation_request'
    autoload :SearchCollocationRequest, 'mushikago/hotaru/search_collocation_request'
    autoload :DeleteCollocationRequest, 'mushikago/hotaru/delete_collocation_request'
    autoload :GetCollocationGraphRequest, 'mushikago/hotaru/get_collocation_graph_request'
  end
end
