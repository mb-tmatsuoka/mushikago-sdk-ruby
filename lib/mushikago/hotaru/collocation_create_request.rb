# -*- coding : utf-8 -*-
module Mushikago
  module Hotaru
    class CollocationCreateRequest < Mushikago::Http::PostRequest
      def path; '/1/hotaru/collocation/create' end
      request_parameter :domain_name
      request_parameter :tags do |v| [v].flatten.compact.join(',') end
      request_parameter :parts_of_speech do |v| [v].flatten.compact.join(',') end
      request_parameter :collocation_name
      request_parameter :lower_threshold
      request_parameter :upper_threshold
      request_parameter :description

      def initialize domain_name, tags, options={}
        super(options)
        self.domain_name = domain_name
        self.tags = tags
        self.parts_of_speech = options[:parts_of_speech] if options.has_key?(:parts_of_speech)
        self.collocation_name = options[:collocation_name] if options.has_key?(:collocation_name)
        self.lower_threshold = options[:lower_threshold] if options.has_key?(:lower_threshold)
        self.upper_threshold = options[:upper_threshold] if options.has_key?(:upper_threshold)
        self.description = options[:description] if options.has_key?(:description)
      end

      # 多くの情報を使って共起グラフを作成する品詞セットです
      POS_LARGE = %w(動詞 形容詞 形容動詞 名詞 代名詞 数詞 連体詞 副詞 接続詞 感動詞 助動詞 助詞)

      # 中程度の情報を使って共起グラフを作成する品詞セットです
      POS_MEDIUM = %w(動詞 形容詞 形容動詞 名詞 副詞 助動詞 助詞)

      # 少しの情報を使って共起グラフを作成する品詞セットです
      POS_SMALL = %w(動詞 形容詞 名詞)
    end
  end
end
