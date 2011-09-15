module Mushikago
  module Tombo
    # キャプチャ一覧取得リクエスト
    class CapturesRequest < Request
      def method_name; 'captures.json' end

      add_param :id
      add_param :limit
      add_param :offset
      add_param :domain
      add_param :tag

      # @param [Hash] options リクエストのオプション
      # @option options [String] :id 画像のID
      # @option options [String] :domain 指定したドメインの画像一覧を取得する
      # @option options [String] :tag 指定したタグの画像一覧を取得する
      # @option options [Integer] :limit(10) 最大取得件数(1-100)
      # @option options [Integer] :offset(0) 取得オフセット
      def initialize options={}
        super(options)
        self.id = options[:id] if options.has_key?(:id)
        self.limit = options[:limit] if options.has_key?(:limit)
        self.offset = options[:offset] if options.has_key?(:offset)
        self.domain = options[:domain] if options.has_key?(:domain)
        self.tag = options[:tag] if options.has_key?(:tag)
      end
    end
  end
end

