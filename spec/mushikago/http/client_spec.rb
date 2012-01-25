# -*- coding: utf-8 -*-
require 'spec_helper'

class TestRequest < Mushikago::Http::Request
  include Mushikago::Auth::Signature
end


describe Mushikago::Http::Client do
  context 'construct without options' do
    before :all do
      @client = Mushikago::Http::Client.new
    end

    subject{ @client }

    its(:api_key){ should == Mushikago.config.api_key.to_s }
  end

  context 'construct with options' do
    before :all do
      @client = Mushikago::Http::Client.new(
        :api_key => 'mushikago api key'
      )
    end

    subject{ @client }

    its(:api_key){ should == 'mushikago api key' }
  end

  context 'send test request' do
    before :all do
      request = TestRequest.new
      request.host = 'tombo.mushikago.org'
      request.path = '/1/info.json'
      client = Mushikago::Http::Client.new
      @response = client.send_request(request)
    end
    subject{ @response }
    it{ should respond_to(:meta, :response) }
  end
end

