# -*- coding: utf-8 -*-
module Mushikago
  module Mitsubachi
    autoload :Client, 'mushikago/mitsubachi/client'
    autoload :Request, 'mushikago/mitsubachi/request'
    autoload :MultipartRequest, 'mushikago/mitsubachi/multipart_request'

    # project
    autoload :ProjectCreateRequest, 'mushikago/mitsubachi/project_create_request'
    autoload :ProjectListRequest, 'mushikago/mitsubachi/project_list_request'
    autoload :ProjectInfoRequest, 'mushikago/mitsubachi/project_info_request'
    autoload :ProjectQueuesRequest, 'mushikago/mitsubachi/project_queues_request'
    autoload :ProjectDeleteRequest, 'mushikago/mitsubachi/project_delete_request'
    autoload :ProjectUpdateRequest, 'mushikago/mitsubachi/project_update_request'
    autoload :ProjectDiscontinueRequest, 'mushikago/mitsubachi/project_discontinue_request'
    # http
    autoload :HttpFetchRequest, 'mushikago/mitsubachi/http_fetch_request'
    autoload :HttpPushRequest, 'mushikago/mitsubachi/http_push_request'

    # script
    autoload :ScriptDeployRequest, 'mushikago/mitsubachi/script_deploy_request'
    autoload :ScriptGetRequest, 'mushikago/mitsubachi/script_get_request'
    autoload :ScriptListRequest, 'mushikago/mitsubachi/script_list_request'
    autoload :ScriptDeleteRequest, 'mushikago/mitsubachi/script_delete_request'

    # resource
    autoload :ResourceStoreRequest, 'mushikago/mitsubachi/resource_store_request'
    autoload :ResourceGetRequest, 'mushikago/mitsubachi/resource_get_request'
    autoload :ResourceListRequest, 'mushikago/mitsubachi/resource_list_request'
    autoload :ResourceDeleteRequest, 'mushikago/mitsubachi/resource_delete_request'
  end
end

