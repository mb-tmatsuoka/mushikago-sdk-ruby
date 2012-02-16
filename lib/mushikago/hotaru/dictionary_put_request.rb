# -*- coding: utf-8 -*-
module Mushikago
  module Hotaru
    class DictionaryPutRequest < Mushikago::Http::MultipartPutRequest
      def path; '/1/hotaru/dictionary/put' end
      request_parameter :dictionary_file
      request_parameter :dictionary_name
      request_parameter :description

      def initialize file_or_file_name, options={}
        super(options)
        if(file_or_file_name.kind_of?(File))
          self.dictionary_file = file_or_file_name
        else
          self.dictionary_file = File.new(file_or_file_name.to_s)
        end
        self.dictionary_name = options[:dictionary_name] if options.has_key?(:dictionary_name)
        self.description = options[:description] if options.has_key?(:description)
      end
    end
  end
end




