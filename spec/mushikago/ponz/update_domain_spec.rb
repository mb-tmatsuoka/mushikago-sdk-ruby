# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Ponz::UpdateDomainRequest do
  shared_examples_for 'a valid request instance' do |n, d, o|
    subject{ Mushikago::Ponz::UpdateDomainRequest.new(n, d, o) }
    it{ should be_kind_of(Mushikago::Http::PostRequest) }
    its(:path){ should == "/1/ponz/domains/#{n}" }
    its(:domain_name){ should == n }
    its(:description){ should == d }
  end

  test_parameters = [
    ['domain_name', 'description', {}],
    ['name', 'description', {}],
  ].each do |n, d, o|
    context ".new(#{n}, #{d}, #{o})" do
      it_should_behave_like 'a valid request instance', n, d, o
    end
  end
end

