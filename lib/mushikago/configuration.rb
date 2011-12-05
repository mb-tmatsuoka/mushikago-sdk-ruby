require 'singleton'
module Mushikago
  # Mushikago SDK for Rubyの各設定
  class Config
    include Singleton

    # @param [Hash] options optionsをロードします
    # @option options [String] :api_key(ENV['MUSHIKAGO_API_KEY']) 発行されたAPIKeyを設定する
    # @option options [String] :secret_key(ENV['MUSHIKAGO_SECRET_KEY']) 発行されたSecretKeyを設定する
    # @option options [String] :tombo_endpoint('tombo.mushikago.org') tomboサービスのエンドポイントを設定する
    # @option options [String] :hotaru_endpoint('hotaru.mushikago.org') hotaruサービスのエンドポイントを設定する
    # @example
    #   Mushikago.config.load(:api_key => 'ABCDEFG', :secret_key => 'HIJKLMN')
    def load options={}
      options.each do |key, value|
        supplied[key.to_sym] = value
      end
    end

    class << self
      # @param [Symbol] name オプション名
      # @param [Object] default_value デフォルト値
      # @param [Hash] options 型情報を補足的に追加することができる
      # @param [Block] transform 渡された値を変換するブロック
      # @option options [Symbol] :boolean 自動的にname?のエイリアスメソッドが生成されます
      private
      def add_option name, default_value = nil, options = {}, &transform
        name = name.to_sym
        raise "The option #{name} is already defined!" if self.respond_to?(name)

        define_method(name) do
          value = supplied.has_key?(name) ? supplied[name] : default_value
          transform ? transform.call(value) : value
        end 

        alias_class_method("#{name}?", name) if options[:boolean]
      end
    end
    
    add_option :api_key, ENV['MUSHIKAGO_API_KEY'] || ENV['MUSHIKAGO_API_KEY_ID']
    add_option :secret_key, ENV['MUSHIKAGO_SECRET_KEY'] || ENV['MUSHIKAGO_SECRET_ACCESS_KEY']
    add_option :tombo_endpoint, 'tombo.mushikago.org'
    add_option :hotaru_endpoint, 'hotaru.mushikago.org'

    # @private
    private
    def supplied
      @supplied ||= {}
    end
  end
end
