# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Hanamgri::UpdateDomainRequest do
  shared_examples_for ' a valid request instance for update_domain' do |n, d, o|
    subject{ Mushikago::Hanamgri::UpdateDomainRequest.new(n, d, o) }
    it{ should be_kind_of(Mushikago::Http::PostRequest) }
    its(:path){ should == "/1/hanamgri/domains/#{n}" }
    its(:domain_name){ should == n }
    its(:description){ should == d }
  end

  test_parameters = [
    ['domain_name', 'description', {}],
    ['name', 'description', {}],
  ].each do |n, d, o|
    context ".new(#{n}, #{d}, #{o})" do
      it_should_behave_like ' a valid request instance for update_domain', n, d, o
    end
  end
end

