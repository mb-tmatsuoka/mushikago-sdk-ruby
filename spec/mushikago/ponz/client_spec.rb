# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Ponz::Client do
  subject{ Mushikago::Ponz::Client.new }
  it{ should be_respond_to(:create_domain) }
  it{ should be_respond_to(:request_analysis) }
  it{ should be_respond_to(:get_analysis) }
  it{ should be_respond_to(:get_queue_size) }
  it{ should be_respond_to(:get_information) }

  [
    [:create_domain, Mushikago::Ponz::CreateDomainRequest, ['domain_name', 'seed']],
    [:request_analysis, Mushikago::Ponz::RequestAnalysisRequest, ['domain_name', 'url']],
    [:get_analysis, Mushikago::Ponz::GetAnalysisRequest, ['domain_name', 'request_id']],
    [:get_queue_size, Mushikago::Ponz::GetQueueSizeRequest, ['domain_name']],
    [:get_information, Mushikago::Ponz::GetInformationRequest, ['domain_name']],
  ].each do |method_name, clazz, args|
    context method_name do
      it "が呼ばれたとき、#{clazz}のインスタンスが生成され、send_requestに渡される" do
        client, mock = create_client_and_request_mock
        clazz.should_receive(:new).with(*args, {}).and_return(mock)
        client.send(method_name, *args)
      end
    end
  end

  # ====================================
  # define helpers 
  def create_client_and_request_mock
    request_mock = Object.new
    client = Mushikago::Ponz::Client.new
    client.should_receive(:send_request).with(request_mock)
    return [client, request_mock]
  end
end

