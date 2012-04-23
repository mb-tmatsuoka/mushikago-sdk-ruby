# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Ponz::DeleteDomainRequest do
  context '.new("domain_name")' do
    subject{ Mushikago::Ponz::DeleteDomainRequest.new('domain_name') }
    it{ should be_kind_of(Mushikago::Http::DeleteRequest) }
    its(:domain_name){ should == 'domain_name' }
    its(:path){ should == '/1/ponz/domains/domain_name' }
  end
end

