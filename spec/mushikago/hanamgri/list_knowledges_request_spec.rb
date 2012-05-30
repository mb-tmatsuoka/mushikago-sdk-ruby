# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Hanamgri::ListKnowledgesRequest do
  context '.new()' do
    subject{ Mushikago::Hanamgri::ListKnowledgesRequest.new() }
    it{ should be_kind_of(Mushikago::Http::GetRequest) }
    its(:path){ should == '/1/hanamgri/knowledges' }
  end

  context '.new(:limit => 20, :offset => 10, :status => "complete")' do
    subject{ Mushikago::Hanamgri::ListKnowledgesRequest.new(:limit => 20, :offset => 10, :status => "complete") }
    it{ should be_kind_of(Mushikago::Http::GetRequest) }
    its(:limit){ should == 20 }
    its(:offset){ should == 10 }
    its(:status){ should == "complete" }
  end
end


