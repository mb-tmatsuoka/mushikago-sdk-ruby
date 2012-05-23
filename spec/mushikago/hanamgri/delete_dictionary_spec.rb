# -*- coding: utf-8 -*-
require 'spec_helper'

describe Mushikago::Hanamgri::DeleteDictionaryRequest do
  context '.new("domain_name")' do
    subject{ Mushikago::Hanamgri::DeleteDictionaryRequest.new('dictionary_name')}
    it{ should be_kind_of(Mushikago::Http::DeleteRequest)}
    its(:dictionary_name){ should == 'dictionary_name'}
    its(:path){ should == '/1/hanamgri/dictionary'}
  end
end