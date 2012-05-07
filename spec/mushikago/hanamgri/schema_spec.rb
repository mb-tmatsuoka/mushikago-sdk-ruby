# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Hanamgri::Schema do
  valid_examples = [
    Mushikago::Hanamgri::Field.new('name', true, :string),
    Mushikago::Hanamgri::Field.new('price', true, :number),
    {:name => 'name', :required => true, :type => :string},
    {:name => 'price', :required => true, :type => :number},
  ]

  valid_examples.each do |field|
    context "adding valid field of #{field.class} #{field.to_json}" do
      it 'should success adding field' do
        proc{ Mushikago::Hanamgri::Schema.new.add field }.should_not raise_error
      end
    end
  end

  it '.new can take a block' do
    proc do
      Mushikago::Hanamgri::Schema.new do
        valid_examples.each do |field|
          add field
        end
      end
    end.should_not raise_error
  end

  it '.to_json format is valid' do
    instance = Mushikago::Hanamgri::Schema.new do
      add valid_examples[0]
      add valid_examples[1]
    end
    instance.to_json.should == {:fields => valid_examples[0,2]}.to_json
  end
  
  invalid_examples = [
    Mushikago::Hanamgri::Field.new('name', true, :double),
    Mushikago::Hanamgri::Field.new('price', true, :boolean),
    {:name => 'name', :required => true, :type => :object},
    {:name => 'price', :required => true, :type => :hogehoge},
  ]
  invalid_examples.each do |field|
    context "adding invalid field of #{field.class} #{field.to_json}" do
      it 'should not success adding field' do
        proc{ Mushikago::Hanamgri::Schema.new.add field }.should raise_error
      end
    end
  end
end
