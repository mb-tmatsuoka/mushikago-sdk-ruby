# -*- coding: utf-8 -*-
module Mushikago
  module Http
    # MushikagoのPUTリクエストを表す抽象クラス
    class PutRequest < Mushikago::Http::Request
      def http_method; 'PUT' end
      include Mushikago::Auth::Signature

      protected
      def new_http_request
        new_http_put_request(path)
      end
    end
  end
end



