# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Hanamgri::GetListDomainsRequest do
  context '.new()' do
    subject{ Mushikago::Hanamgri::GetListDomainsRequest.new() }
    it{ should be_kind_of(Mushikago::Http::GetRequest) }
    its(:path){ should == '/1/hanamgri/domains' }
  end

  context '.new(:limit => 20, :offset => 10,:filter => "domain")' do
    subject{ Mushikago::Hanamgri::GetListDomainsRequest.new(:limit => 20, :offset => 10,:filter => 'domain') }
    it{ should be_kind_of(Mushikago::Http::GetRequest) }
    its(:limit){ should == 20 }
    its(:offset){ should == 10 }
    its(:filter){ should == 'domain' }
  end
end

