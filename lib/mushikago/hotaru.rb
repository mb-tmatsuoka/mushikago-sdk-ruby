# -*- coding: utf-8 -*-
module Mushikago
  # Hotaruへのアクセスを行うモジュール
  module Hotaru
    autoload :Client, 'mushikago/hotaru/client'

    # domain
    autoload :DomainCreateRequest, 'mushikago/hotaru/domain_create_request'
    autoload :DomainInfoRequest, 'mushikago/hotaru/domain_info_request'
    autoload :DomainListRequest, 'mushikago/hotaru/domain_list_request'
    autoload :DomainDeleteRequest, 'mushikago/hotaru/domain_delete_request'

    # text
    autoload :TextListRequest, 'mushikago/hotaru/text_list_request'

    # classifier

    # collocation
    autoload :CollocationListRequest, 'mushikago/hotaru/collocation_list_request'

    # dictionary
    autoload :DictionaryPutRequest, 'mushikago/hotaru/dictionary_put_request'
    autoload :DictionaryListRequest, 'mushikago/hotaru/dictionary_list_request'
  end
end
