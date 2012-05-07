# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Hanamgri::Field do
  shared_examples_for 'a json serializable struct' do |n, r, t|
    its(:name){ should == n }
    its(:required){ should == r }
    its(:type){ should == t }
    its(:to_json){ should == {:name => n, :required => r, :type => t}.to_json }
  end

  context 'construct with' do
    [
      ['name', true, :string],
      ['価格', true, :number],
      ['shipping', false, :number],
      ['説明', false, :string],
    ].each do |n, r, t|
      context "(name:#{n} required:#{r} type:#{t})" do
        subject{ Mushikago::Hanamgri::Field.new(n, r, t) }
        it_should_behave_like 'a json serializable struct', n, r, t
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
    ].each do |n, r, t|
      context "(name:#{n} required:#{r} type:#{t})" do
        subject{ Mushikago::Hanamgri::Field.new(n, r, t) }
        it_should_behave_like 'a json serializable struct', n, r, t
        it('should not validate') do
          proc{ subject.validate! }.should raise_error
        end
      end
    end
  end
end
