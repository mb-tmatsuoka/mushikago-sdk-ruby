# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Ponz::Schema do
  valid_examples = [
    Mushikago::Ponz::Field.new('name', true, :string),
    Mushikago::Ponz::Field.new('price', true, :number),
    {:name => 'name', :required => true, :type => :string},
    {:name => 'price', :required => true, :type => :number},
  ]

  valid_examples.each do |field|
    context "adding valid field of #{field.class} #{field.to_json}" do
      it 'should success adding field' do
        proc{ Mushikago::Ponz::Schema.new.add field }.should_not raise_error
      end
    end
  end

  it '.new can take a block' do
    proc do
      Mushikago::Ponz::Schema.new do
        valid_examples.each do |field|
          add field
        end
      end
    end.should_not raise_error
  end

  it '.to_json format is valid' do
    instance = Mushikago::Ponz::Schema.new do
      add valid_examples[0]
      add valid_examples[1]
    end
    instance.to_json.should == {:fields => valid_examples[0,2]}.to_json
  end
  
  invalid_examples = [
    Mushikago::Ponz::Field.new('name', true, :double),
    Mushikago::Ponz::Field.new('price', true, :boolean),
    {:name => 'name', :required => true, :type => :object},
    {:name => 'price', :required => true, :type => :hogehoge},
  ]
  invalid_examples.each do |field|
    context "adding invalid field of #{field.class} #{field.to_json}" do
      it 'should not success adding field' do
        proc{ Mushikago::Ponz::Schema.new.add field }.should raise_error
      end
    end
  end
end
