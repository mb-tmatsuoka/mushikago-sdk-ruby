# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Hanamgri::SearchSchemaRequest do
  shared_examples_for 'a valid request instance for search_schema' do |n, k, v, o|
    subject{ Mushikago::Hanamgri::SearchSchemaRequest.new(n, k, v, o)}
    it{ should be_kind_of(Mushikago::Http::GetRequest)}
    its(:path){ should == "/1/hanamgri/domains/#{n}/schema/search"}
    its(:domain_name){ should = n }
    its(:query_key){ should = k }
    its(:query_value){ should = v }
  end
  
  test_parameters = [
    ['domain_name', 'query_key', 'query_value', {}],
    ['name', 'key', 'value', {}],
  ].each do |n, k, v, o|
    context ".new(#{n}, #{k}, #{v}, #{o})" do
      it_should_behave_like 'a valid request instance for search_schema', n, k, v, o
    end
  end
end
