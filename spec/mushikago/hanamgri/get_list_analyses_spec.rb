# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Hanamgri::GetListAnalysesRequest do
  shared_examples_for 'a valid request instance for get_list_analyses' do |n, o|
    subject{ Mushikago::Hanamgri::GetListAnalysesRequest.new(n, o) }
    it{ should be_kind_of(Mushikago::Http::GetRequest) }
    its(:path){ should == "/1/hanamgri/domains/#{n}/analyses" }
    its(:domain_name){ should == n }
    its(:limit){ should == o[:limit] }
    its(:offset){ should == o[:offset] }
    its(:filter){ should == o[:filter] }
    its(:status){ should == o[:status] }
  end

  test_parameters = [
    ['domain_name', {}],
    ['name', {:limit => 20, :offset => 5, :status => 'complete'}],
  ].each do |n, o|
    context ".new(#{n}, #{o})" do
      it_should_behave_like 'a valid request instance for get_list_analyses', n, o
    end
  end
end

