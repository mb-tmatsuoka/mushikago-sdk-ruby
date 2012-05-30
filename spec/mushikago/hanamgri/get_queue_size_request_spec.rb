# -*- coding : utf-8 -*-
require 'spec_helper'
describe Mushikago::Hanamgri::GetQueueSizeRequest do
  context 'のインスタンス' do
    subject{ Mushikago::Hanamgri::GetQueueSizeRequest.new('domain_name')}
    it{ should be_kind_of(Mushikago::Http::GetRequest)}
    its(:path){ should == '/1/hanamgri/domains/domain_name/queues'}
    its(:domain_name){ should == 'domain_name'}
  end
end
