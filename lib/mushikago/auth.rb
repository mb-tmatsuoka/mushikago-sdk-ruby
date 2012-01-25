# -*- coding: utf-8 -*-
module Mushikago
  # Mushikagoサービスの認証を扱うモジュール
  module Auth
    autoload :Signature, 'mushikago/auth/signature'
    autoload :Signer, 'mushikago/auth/signer'
  end
end

