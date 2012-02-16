# -*- coding: utf-8 -*-
module Mushikago
  module Http
    # MushikagoのGETリクエストを表す抽象クラス
    class GetRequest < Mushikago::Http::Request
      def http_method; 'GET' end
      include Mushikago::Auth::Signature

      protected
      def new_http_request
        new_http_get_request("#{path}?#{url_encoded_params}")
      end
    end
  end
end

