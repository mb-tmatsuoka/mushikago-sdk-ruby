# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Hanamgri::Client do
  subject{ Mushikago::Hanamgri::Client.new }
  it{ should be_respond_to(:create_domain) }
  it{ should be_respond_to(:delete_domain) }
  it{ should be_respond_to(:request_analysis) }
  it{ should be_respond_to(:get_analysis) }
  it{ should be_respond_to(:get_queue_size) }
  it{ should be_respond_to(:get_information) }
  it{ should be_respond_to(:list_domains) }
  it{ should be_respond_to(:update_domain) }
  it{ should be_respond_to(:list_analyses) }
  it{ should be_respond_to(:search_schema) }
  it{ should be_respond_to(:train) }

  [
    [:create_domain, Mushikago::Hanamgri::CreateDomainRequest, ['domain_name', 'seeds', Mushikago::Hanamgri::Schema.new, {}]],
    [:delete_domain, Mushikago::Hanamgri::DeleteDomainRequest, ['domain_name', {}]],
    [:request_analysis, Mushikago::Hanamgri::RequestAnalysisRequest, ['domain_name', 'url', {}]],
    [:get_analysis, Mushikago::Hanamgri::GetAnalysisRequest, ['domain_name', 'request_id', {}]],
    [:get_queue_size, Mushikago::Hanamgri::GetQueueSizeRequest, ['domain_name', {}]],
    [:get_information, Mushikago::Hanamgri::GetInformationRequest, ['domain_name', {}]],
    [:list_domains, Mushikago::Hanamgri::GetListDomainsRequest, [{}]],
    [:update_domain, Mushikago::Hanamgri::UpdateDomainRequest, ['domain_name', 'description', {}]],
    [:list_analyses, Mushikago::Hanamgri::GetListAnalysesRequest, ['domain_name', {:limit => 20, :offset => 5, :status => 'complete'}]],
    [:search_schema, Mushikago::Hanamgri::SearchSchemaRequest, ['domain_name', 'query_key', 'query_value', {:limit => 20, :offset => 5}]],
    [:train, Mushikago::Hanamgri::TrainRequest, ['domain_name', 'http://www.mushikago.org/', Mushikago::Hanamgri::TrainingData.new, {}]],
  ].each do |method_name, clazz, args|
    context method_name do
      it "が呼ばれたとき、#{clazz}のインスタンスが生成され、send_requestに渡される" do
        client, mock = create_client_and_request_mock
        clazz.should_receive(:new).with(*args).and_return(mock)
        client.send(method_name, *args)
      end
    end
  end

  # ====================================
  # define helpers 
  def create_client_and_request_mock
    request_mock = Object.new
    client = Mushikago::Hanamgri::Client.new
    client.should_receive(:send_request).with(request_mock)
    return [client, request_mock]
  end
end

