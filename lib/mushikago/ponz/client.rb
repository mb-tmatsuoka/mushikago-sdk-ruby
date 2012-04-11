# -*- coding : utf-8 -*-
module Mushikago
  module Ponz
    # Ponzサービスを利用する
    #
    # @example
    #   client = Mushikago::Ponz::Client.new(:api_key => '<api_key>', :secret_key => '<secret_key>')
    #
    # @example APIキーをファイルから読み込む場合
    #   Mushikago.config.load(YAML.load(File.read('config.yml')))
    #   client = Mushikago::Ponz::Client.new
    class Client < Mushikago::Http::Client
    end
  end
end
