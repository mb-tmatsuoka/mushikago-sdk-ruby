# -*- coding : utf-8 -*-
module Mushikago
  module Hotaru
    class DictionaryDeleteRequest < Mushikago::Http::DeleteRequest
      def path; '/1/hotaru/dictionary/delete' end
      request_parameter :dictionary_id

      def initialize dictionary_id, options={}
        super(options)
        self.dictionary_id = dictionary_id
      end
    end
  end
end
