# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Ponz::RequestAnalysisRequest do
  context '.new("domain_name", "url")' do
    subject{ Mushikago::Ponz::RequestAnalysisRequest.new('domain_name', 'url') }
    it{ should be_kind_of(Mushikago::Http::PutRequest) }
    its(:domain_name){ should == 'domain_name' }
    its(:url){ should == 'url' }
    its(:path){ should == '/1/ponz/domains/domain_name/analysis' }
  end

  context '.new("domain_name", "url", :charset => "utf-8", :tag => "tag")' do
    subject{ Mushikago::Ponz::RequestAnalysisRequest.new('domain_name', 'url', :charset => 'utf-8', :tag => 'tag') }
    it{ should be_kind_of(Mushikago::Http::PutRequest) }
    its(:domain_name){ should == 'domain_name' }
    its(:url){ should == 'url' }
    its(:charset){ should == 'utf-8' }
    its(:tag){ should == 'tag' }
  end
end
