# -*- coding : utf-8 -*-
module Mushikago
  module Hanamgri
    class DeleteDictionaryRequest < Mushikago::Http::DeleteRequest
      def path; "/1/hanamgri/dictionary" end
      attr_accessor :dictionary_name
      
      def initialize dictionary_name, options={}
        super(options)
        self.dictionary_name = dictionary_name
      end
    end
  end
end