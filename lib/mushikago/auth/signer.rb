require 'base64'
require 'openssl'

module Mushikago
  module Auth
    # 署名を作成するクラス
    class Signer
      # @return [String] シークレットキー
      attr_reader :secret_key

      # @param [String] secret_key シークレットキー
      def initialize secret_key
        @secret_key = secret_key
      end

      # @param [String] string_to_sign 署名の元になる文字列
      # @param [String] digest_method 署名作成のアルゴリズム
      # @return [String] 署名
      def sign(string_to_sign, digest_method='sha256')
        Base64.encode64(
          OpenSSL::HMAC.digest(
            OpenSSL::Digest::Digest.new(digest_method),
            secret_key,
            string_to_sign
          )
        ).strip
      end
    end
  end
end
