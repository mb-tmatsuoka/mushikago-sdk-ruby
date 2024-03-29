# -*- coding: utf-8 -*-
require 'spec_helper'

describe Mushikago::Tombo::InfoRequest do
  before :all do
    @request = Mushikago::Tombo::InfoRequest.new
  end

  subject{ @request }

  its(:host){ should == Mushikago.config.endpoint }
  its(:http_method){ should == 'GET' }
  its(:path){ should == '/1/tombo/info' }
end

