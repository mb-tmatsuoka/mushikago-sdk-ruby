module Mushikago
  module Tombo
    # キャプチャリクエスト
    class CaptureRequest < Request
      def method_name; 'capture.json' end

      add_param :url
      add_param :image_format
      add_param :image_quality do |v| v.to_i.to_s end
      add_param :thumbnail do |v| (v ? 1 : 0).to_s end
      add_param :tags do |v| [v].flatten.compact.join(',') end
      add_param :useragent

      # @param [String] url キャプチャ対象のURL
      # @param [Hash] options リクエストのオプション
      # @option options [String] :image_format('jpg') 画像のフォーマット(jpg,png)
      # @option options [Integer] :image_quality(80) 画像の品質(0-100)
      # @option options [Boolean] :thumbnail(0) サムネイル取得フラグ(false:取得しない,true:取得する)
      # @option options [String,Array] :tags タグ
      # @option options [String] :useragent ユーザエージェント
      def initialize url, options={}
        super(options)
        self.url = url
        self.image_format = options[:image_format] if options.has_key?(:image_format)
        self.image_quality = options[:image_quality] if options.has_key?(:image_quality)
        self.thumbnail = options[:thumbnail] if options.has_key?(:thumbnail)
        self.tags = options[:tags] if options.has_key?(:tags)
        self.useragent = options[:useragent] if options.has_key?(:useragent)
        @headers['Content-type'] = 'application/x-www-form-urlencoded; charset=utf-8'
      end

      # @private
      def new_http_request
        new_http_post_request(path)
      end
    end
  end
end

