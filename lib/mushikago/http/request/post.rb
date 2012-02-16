# -*- coding: utf-8 -*-
module Mushikago
  module Http
    # MushikagoのPOSTリクエストを表す抽象クラス
    class PostRequest < Mushikago::Http::Request
      def http_method; 'POST' end
      include Mushikago::Auth::Signature

      protected
      def new_http_request
        new_http_post_request(path)
      end
    end
  end
end


