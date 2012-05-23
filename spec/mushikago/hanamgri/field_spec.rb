# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Hanamgri::Field do
  shared_examples_for 'a json serializable struct' do |n, r, t, k|
    its(:name){ should == n }
    its(:required){ should == r }
    its(:type){ should == t }
    its(:to_json){ should == {:name => n, :required => r, :type => t, :knowledge_name => k}.to_json }
  end

  context 'construct with' do
    [
      ['name', true, :string],
      ['価格', true, :number],
      ['shipping', false, :number],
      ['説明', false, :string],
      ['name', true, :string, 'mushikago/ec/title'],
    ].each do |n, r, t, k|
      context "(name:#{n} required:#{r} type:#{t} knowledge_name:#{k})" do
        subject{ Mushikago::Hanamgri::Field.new(n, r, t, k) }
        it_should_behave_like 'a json serializable struct', n, r, t, k
        it('should validate') do
          proc{ subject.validate! }.should_not raise_error
        end
      end
    end
    
    [
      ['name', true, :double],
      ['価格', true, :float],
      ['shipping', false, :object],
      ['説明', false, :null],
    ].each do |n, r, t, k|
      context "(name:#{n} required:#{r} type:#{t}) knowledge_name#{k}" do
        subject{ Mushikago::Hanamgri::Field.new(n, r, t, k) }
        it_should_behave_like 'a json serializable struct', n, r, t, k
        it('should not validate') do
          proc{ subject.validate! }.should raise_error
        end
      end
    end
  end
end
