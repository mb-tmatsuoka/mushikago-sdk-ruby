# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Ponz::Client do
  subject{ Mushikago::Ponz::Client.new }
  it{ should be_respond_to(:create_domain) }
  it{ should be_respond_to(:request_analysis) }
  it{ should be_respond_to(:get_analysis) }
  it{ should be_respond_to(:get_queue_size) }

  context 'create_domain' do
    it 'が呼ばれたとき、Mushikago::Ponz::CreateDomainRequestのインスタンスが生成され、send_requestに渡される' do
      client, mock = create_client_and_request_mock
      Mushikago::Ponz::CreateDomainRequest.should_receive(:new).with('domain_name', 'seed', {}).and_return(mock)
      client.create_domain('domain_name', 'seed')
    end
  end

  context 'get_queue_size' do
    it 'が呼ばれたとき、Mushikago::Ponz::GetQueueSizeRequestのインスタンスが生成され、send_requestに渡される' do
      client, mock = create_client_and_request_mock
      Mushikago::Ponz::GetQueueSizeRequest.should_receive(:new).with('domain_name', {}).and_return(mock)
      client.get_queue_size('domain_name')
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

