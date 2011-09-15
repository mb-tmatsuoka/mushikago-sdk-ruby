module Mushikago
  module Auth
    # MushikagoのリクエストにMix-inして利用する
    module Signature
      # リクエストの情報から以下のような署名用文字列を作成する
      #   GET
      #   localhost
      #   /1/info.json
      #   api_key=api_key&timestamp=2011-09-01T00%3A00%3A00Z
      # @return [String] 署名用の文字列
      def string_to_sign
        [
          http_method,
          host,
          path,
          url_encoded_params,
        ].join("\n")
      end

      # リクエストに署名を追加する
      # @param signer [Mushikago::Auth::Signer] 署名を作成するオブジェクト
      def add_signature! signer
        self['signature'] = signer.sign(string_to_sign)
      end
    end
  end
end
