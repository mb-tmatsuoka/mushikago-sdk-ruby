module Mushikago
  # Hotaruへのアクセスを行うモジュール
  module Hotaru
    autoload :Client, 'mushikago/hotaru/client'
    autoload :Request, 'mushikago/hotaru/request'
  end
end
