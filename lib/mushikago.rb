# -*- coding: utf-8 -*-
# Mushikagoサービスを提供するモジュール
module Mushikago
  # class
  autoload :Config, 'mushikago/configuration'

  # module
  autoload :Http, 'mushikago/http'
  autoload :Auth, 'mushikago/auth'
  autoload :Tombo, 'mushikago/tombo'
  autoload :Hotaru, 'mushikago/hotaru'

  # @return [Mushikago::Config] config コンフィグのインスタンスへのアクセスを提供する
  def self.config
    Config.instance
  end
end

