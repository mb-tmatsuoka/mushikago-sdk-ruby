# -*- coding : utf-8 -*-
# 概要
#   tools/generatorはリクエストオブジェクトのスケルトンを自動生成するためのスクリプトです
#   わりと適当に作ってあります。
#
# 使い方
#   autoloadが並べられているファイルを標準出力に渡します
#   cat <autoloadのファイル> | ruby tools/generator.rb <モジュール名>
#
# 例
#   cat lib/mushikago/hotaru.rb | grep autoload | ruby tools/generator.rb Hotaru
m = ARGV.shift
while (line=gets) do
  line.strip.split(/[, :']+/).each_slice(3) do |dummy, class_name, path|
    file_name = path.split('/').last.chomp
    method_name = file_name.gsub('_request', '').gsub('_', '/')
    File.open("#{file_name}.rb", 'w') do |f|
      f.puts "# -*- coding : utf-8 -*-"
      f.puts "module Mushikago"
      f.puts "  module #{m}"
      f.puts "    class #{class_name} < Mushikago::Http::GetRequest"
      f.puts "      def path; '/1/#{m.downcase}/#{method_name}' end"
      f.puts "      request_parameter :domain_name"
      f.puts ""
      f.puts "      def initialize domain_name, options={}"
      f.puts "        super(options)"
      f.puts "        self.domain_name = domain_name"
      f.puts "#        self._param = options[:_param] if options.has_key?(:_param)"
      f.puts "      end"
      f.puts "    end"
      f.puts "  end"
      f.puts "end"
    end
  end
end
