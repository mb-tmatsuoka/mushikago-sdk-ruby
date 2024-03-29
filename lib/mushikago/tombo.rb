# -*- coding: utf-8 -*-
module Mushikago
  # Tomboへのアクセスを行うモジュール
  module Tombo
    autoload :Client, 'mushikago/tombo/client'
    autoload :CaptureRequest, 'mushikago/tombo/capture_request'
    autoload :CapturesRequest, 'mushikago/tombo/captures_request'
    autoload :DeleteRequest, 'mushikago/tombo/delete_request'
    autoload :InfoRequest, 'mushikago/tombo/info_request'
  end
end
