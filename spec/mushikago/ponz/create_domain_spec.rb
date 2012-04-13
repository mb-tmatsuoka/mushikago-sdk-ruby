# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Ponz::CreateDomainRequest do
  context '.new("domain_name", "seed")' do
    subject{ Mushikago::Ponz::CreateDomainRequest.new('domain_name', 'seed') }
    it{ should be_kind_of(Mushikago::Http::PutRequest) }
    its(:domain_name){ should == 'domain_name' }
    its(:seed){ should == 'seed' }
  end

  context '.new("domain_name", "seed", :description => "description")' do
    subject{ Mushikago::Ponz::CreateDomainRequest.new('domain_name', 'seed', :description => 'description') }
    it{ should be_kind_of(Mushikago::Http::PutRequest) }
    its(:domain_name){ should == 'domain_name' }
    its(:seed){ should == 'seed' }
    its(:description){ should == 'description' }
  end
end

