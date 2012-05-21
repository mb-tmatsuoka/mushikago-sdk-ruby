# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Hanamgri::SaveKnowledgeRequest do
  shared_examples_for 'a valid request instance for save_knowledge' do |n, o|
    subject{ Mushikago::Hanamgri::SaveKnowledgeRequest.new(n, o) }
    it{ should be_kind_of(Mushikago::Http::PutRequest) }
    its(:path){ should == "/1/hanamgri/knowledge" }
    its(:domain_name){ should == n }
    its(:description){ should == o[:description] }
  end

  test_parameters = [
    ['domain_name', {}],
    ['name', {:description => '学習データの説明'}],
  ].each do |n, o|
    context ".new(#{n}, #{o})" do
      it_should_behave_like 'a valid request instance for save_knowledge', n, o
    end
  end
end

