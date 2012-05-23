# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Hanamgri::ListDictionariesRequest do
  context '.new()' do
    subject{ Mushikago::Hanamgri::ListDictionariesRequest.new() }
    it{ should be_kind_of(Mushikago::Http::GetRequest) }
    its(:path){ should == '/1/hanamgri/dictionaries' }
  end

  context '.new(:limit => 20, :offset => 10)' do
    subject{ Mushikago::Hanamgri::ListDictionariesRequest.new(:limit => 20, :offset => 10) }
    it{ should be_kind_of(Mushikago::Http::GetRequest) }
    its(:limit){ should == 20 }
    its(:offset){ should == 10 }
  end
end


