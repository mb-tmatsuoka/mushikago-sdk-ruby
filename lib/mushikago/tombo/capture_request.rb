# -*- coding: utf-8 -*-
module Mushikago
  module Tombo
    # キャプチャリクエスト
    class CaptureRequest < Mushikago::Http::PostRequest
      def path; '/1/tombo/capture' end

      request_parameter :url
      request_parameter :image_format
      request_parameter :image_quality do |v| v.to_i.to_s end
      request_parameter :thumbnail do |v| (v ? 1 : 0).to_s end
      request_parameter :tags do |v| [v].flatten.compact.join(',') end
      request_parameter :useragent

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
    end
  end
end

