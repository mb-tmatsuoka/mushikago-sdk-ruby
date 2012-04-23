# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Ponz::GetDomainListRequest do
  context '.new()' do
    subject{ Mushikago::Ponz::GetDomainListRequest.new() }
    it{ should be_kind_of(Mushikago::Http::GetRequest) }
    its(:path){ should == '/1/ponz/domains' }
  end

  context '.new(:limit => 20, :offset => 10,:filter => 'domain')' do
    subject{ Mushikago::Ponz::CreateDomainRequest.new(:limit => 20, :offset => 10,:filter => 'domain') }
    it{ should be_kind_of(Mushikago::Http::GetRequest) }
    its(:limit){ should == 20 }
    its(:offset){ should == 10 }
    its(:filter){ should == 'domain' }
  end
end

