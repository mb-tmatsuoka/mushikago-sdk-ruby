# -*- coding: utf-8 -*-
module Mushikago
  # Hotaruへのアクセスを行うモジュール
  module Hotaru
    autoload :Client, 'mushikago/hotaru/client'

    # domain
    autoload :DomainCreateRequest, 'mushikago/hotaru/domain_create_request'
    autoload :DomainInfoRequest, 'mushikago/hotaru/domain_info_request'
    autoload :DomainListRequest, 'mushikago/hotaru/domain_list_request'
    autoload :DomainDeleteRequest, 'mushikago/hotaru/domain_delete_request'

    # text
    autoload :TextListRequest, 'mushikago/hotaru/text_list_request'
    autoload :TextPutRequest, 'mushikago/hotaru/text_put_request'
    autoload :TextDeleteRequest, 'mushikago/hotaru/text_delete_request'
    autoload :TextTagsetRequest, 'mushikago/hotaru/text_tagset_request'
    autoload :TextGetRequest, 'mushikago/hotaru/text_get_request'

    # classifier
    autoload :ClassifierJudgeRequest, 'mushikago/hotaru/classifier_judge_request'

    # collocation
    autoload :CollocationListRequest, 'mushikago/hotaru/collocation_list_request'
    autoload :CollocationDeleteRequest, 'mushikago/hotaru/collocation_delete_request'
    autoload :CollocationGetRequest, 'mushikago/hotaru/collocation_get_request'
    autoload :CollocationCreateRequest, 'mushikago/hotaru/collocation_create_request'
    autoload :CollocationDownloadRequest, 'mushikago/hotaru/collocation_download_request'
    autoload :CollocationWordcountRequest, 'mushikago/hotaru/collocation_wordcount_request'

    # tag
    autoload :TagListRequest, 'mushikago/hotaru/tag_list_request'

    # word
    autoload :WordListRequest, 'mushikago/hotaru/word_list_request'
    autoload :WordGetRequest, 'mushikago/hotaru/word_get_request'

    # dictionary
    autoload :DictionaryPutRequest, 'mushikago/hotaru/dictionary_put_request'
    autoload :DictionaryListRequest, 'mushikago/hotaru/dictionary_list_request'
    autoload :DictionaryDeleteRequest, 'mushikago/hotaru/dictionary_delete_request'
  end
end
