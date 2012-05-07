# -*- coding : utf-8 -*-
require 'spec_helper'
describe Mushikago::Ponz::GetInformationRequest do
  domain_name = 'domain_name'
  path = "/1/ponz/domains/#{domain_name}"
  
  context 'のインスタンス' do
    subject{ Mushikago::Ponz::GetInformationRequest.new(domain_name)}
    it{ should be_kind_of(Mushikago::Http::GetRequest)}
    its(:path){ should == path }
    its(:domain_name){ should == domain_name }
  end
  
end
