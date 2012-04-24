# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Ponz::CreateDomainRequest do
  before :all do
    @schema = Mushikago::Ponz::Schema.new do
      add Mushikago::Ponz::Field.new('name', true, :string)
      add Mushikago::Ponz::Field.new('price', true, :number)
      add Mushikago::Ponz::Field.new('shipping', false, :string)
      add Mushikago::Ponz::Field.new('description', false, :string)
    end
  end

  shared_examples_for 'a valid request instance' do |n, s, o|
    subject{ Mushikago::Ponz::CreateDomainRequest.new(n, s, @schema, o) }
    it{ should be_kind_of(Mushikago::Http::PutRequest) }
    its(:path){ should == "/1/ponz/domains/#{n}" }
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

