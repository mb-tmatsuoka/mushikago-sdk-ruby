# -*- coding: utf-8 -*-
module Mushikago
  # MushikagoサービスへのHTTPリクエストを扱うモジュール
  module Http
    autoload :Client, 'mushikago/http/client'
    autoload :Request, 'mushikago/http/request'
    autoload :MultipartRequest, 'mushikago/http/multipart_request'
    autoload :Response, 'mushikago/http/response'
  end
end

