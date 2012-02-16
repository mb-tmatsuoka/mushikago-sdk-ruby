# -*- coding: utf-8 -*-
module Mushikago
  module Http
    # MushikagoのDELETEリクエストを表す抽象クラス
    class DeleteRequest < Mushikago::Http::Request
      def http_method; 'DELETE' end
      include Mushikago::Auth::Signature

      protected
      def new_http_request
        new_http_delete_request("#{path}?#{url_encoded_params}")
      end
    end
  end
end


