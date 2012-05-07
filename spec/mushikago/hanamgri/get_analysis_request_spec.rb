# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Hanamgri::GetAnalysisRequest do
  context '.new("domain_name", "request_id")' do
    subject{ Mushikago::Hanamgri::GetAnalysisRequest.new('domain_name', 'request_id')}
    it{ should be_kind_of(Mushikago::Http::GetRequest)}
    its(:domain_name){ should == 'domain_name'}
    its(:request_id){ should == 'request_id'}
    its(:path){ should == '/1/hanamgri/domains/domain_name/analysises/request_id'}
  end
end
