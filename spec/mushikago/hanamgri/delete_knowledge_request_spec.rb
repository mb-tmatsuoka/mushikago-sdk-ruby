# -*- coding: utf-8 -*-
require 'spec_helper'

describe Mushikago::Hanamgri::DeleteKnowledgeRequest do
  context '.new("domain_name")' do
    subject{ Mushikago::Hanamgri::DeleteKnowledgeRequest.new('knowledge_name')}
    it{ should be_kind_of(Mushikago::Http::DeleteRequest)}
    its(:knowledge_name){ should == 'knowledge_name'}
    its(:path){ should == '/1/hanamgri/knowledge'}
  end
end
