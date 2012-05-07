# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Hanamgri::CreateDomainRequest do
  before :all do
    @schema = Mushikago::Hanamgri::Schema.new do
      add Mushikago::Hanamgri::Field.new('name', true, :string)
      add Mushikago::Hanamgri::Field.new('price', true, :number)
      add Mushikago::Hanamgri::Field.new('shipping', false, :string)
      add Mushikago::Hanamgri::Field.new('description', false, :string)
    end
  end

  shared_examples_for 'a valid request instance' do |n, s, o|
    subject{ Mushikago::Hanamgri::CreateDomainRequest.new(n, s, @schema, o) }
    it{ should be_kind_of(Mushikago::Http::PutRequest) }
    its(:path){ should == "/1/hanamgri/domains/#{n}" }
    its(:domain_name){ should == n }
    its(:seed){ should == s }
    its(:schema){ should == @schema.to_json }
    its(:description){ should == o[:description] }
  end

  test_parameters = [
    ['domain_name', 'seed', {}],
    ['name', 'seed', {:description => 'description'}],
  ].each do |n, s, o|
    context ".new(#{n}, #{s}, #{o})" do
      it_should_behave_like 'a valid request instance', n, s, o
    end
  end
end

