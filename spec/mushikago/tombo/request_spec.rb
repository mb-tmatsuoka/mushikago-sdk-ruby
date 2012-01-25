# -*- coding: utf-8 -*-
require 'spec_helper'

describe Mushikago::Tombo::Request do
  before :all do
    @request = Mushikago::Tombo::Request.new
  end

  subject{ @request }

  its(:host){ should == Mushikago.config.endpoint }

  context 'construct with options' do
    before :all do
      @request = Mushikago::Tombo::Request.new(:endpoint => 'localhost:18080')
    end

    subject{ @request }

    its(:host){ should == 'localhost' }
    its('port.to_i'){ should == 18080 }
  end
end
