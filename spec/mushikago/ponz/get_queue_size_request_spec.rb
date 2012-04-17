# -*- coding : utf-8 -*-
require 'spec_helper'
describe Mushikago::Ponz::GetQueueSizeRequest do
  context 'のインスタンス' do
    subject{ Mushikago::Ponz::GetQueueSizeRequest.new('domain_name')}
    it{ should be_kind_of(Mushikago::Http::GetRequest)}
    its(:path){ should == '/1/ponz/domains/domain_name/queues'}
    its(:domain_name){ should == 'domain_name'}
  end
end
