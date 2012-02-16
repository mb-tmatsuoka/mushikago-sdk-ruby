# -*- coding: utf-8 -*-
module Mushikago
  # Hotaruへのアクセスを行うモジュール
  module Hotaru
    autoload :Client, 'mushikago/hotaru/client'
    autoload :Request, 'mushikago/hotaru/request'

    autoload :DomainCreateRequest, 'mushikago/hotaru/domain_create_request'
  end
end
