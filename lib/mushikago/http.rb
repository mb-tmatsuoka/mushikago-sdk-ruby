# -*- coding: utf-8 -*-
module Mushikago
  # MushikagoサービスへのHTTPリクエストを扱うモジュール
  module Http
    autoload :Client, 'mushikago/http/client'
    autoload :Request, 'mushikago/http/request'
    autoload :MultipartRequest, 'mushikago/http/multipart'
    autoload :Response, 'mushikago/http/response'
    autoload :GetRequest, 'mushikago/http/request/get'
    autoload :PostRequest, 'mushikago/http/request/post'
    autoload :PutRequest, 'mushikago/http/request/put'
    autoload :DeleteRequest, 'mushikago/http/request/delete'
    autoload :MultipartPostRequest, 'mushikago/http/request/multipart_post'
    autoload :MultipartPutRequest, 'mushikago/http/request/multipart_put'
  end
end

