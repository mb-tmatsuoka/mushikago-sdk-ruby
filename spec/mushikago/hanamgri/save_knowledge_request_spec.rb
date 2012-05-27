# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Hanamgri::SaveKnowledgeRequest do
  shared_examples_for 'a valid request instance for save_knowledge' do |n, f, o|
    subject{ Mushikago::Hanamgri::SaveKnowledgeRequest.new(n, f, o) }
    it{ should be_kind_of(Mushikago::Http::PutRequest) }
    its(:path){ should == "/1/hanamgri/knowledge" }
    its(:domain_name){ should == n }
    its(:field_name){ should == f }
    its(:description){ should == o[:description] }
  end

  test_parameters = [
    ['domain_name', 'field_name', {}],
    ['name', 'field_name', {:description => '学習データの説明'}],
  ].each do |n, f, o|
    context ".new(#{n}, #{f}, #{o})" do
      it_should_behave_like 'a valid request instance for save_knowledge', n, f, o
    end
  end
end

