# -*- coding : utf-8 -*-
require 'spec-helper'

describe Mushikago::Hanamgri::DeleteDomainRequest do
  context '.new("domain_name")' do
    subject{ Mushikago::Hanamgri::DeleteDomainRequest.new('domain_name') }
    it{ should be_kind_of(Mushikago::Http::DeleteRequest) }
    its(:domain_name){ should == 'domain_name' }
    its(:path){ should == '/1/hanamgri/domains/domain_name' }
  end
end

