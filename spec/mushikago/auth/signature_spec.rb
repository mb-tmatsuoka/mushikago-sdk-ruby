# -*- coding: utf-8 -*-
require 'spec_helper'

class TestRequest < Mushikago::Http::Request
  include Mushikago::Auth::Signature
end

describe Mushikago::Auth::Signature do
  before do
    @request = TestRequest.new
    @request.http_method = 'GET'
    @request.host = 'mushikago.org'
    @request.path = '/1/someapi.json'
    @request['api_key'] = 'api_key'
    @request['timestamp'] = '2011-09-01T00:00:00Z'
  end

  context 'generates string to sign' do
    subject{ @request.string_to_sign }
    it{ should == "GET\nmushikago.org\n/1/someapi.json\napi_key=api_key&timestamp=2011-09-01T00%3A00%3A00Z" }
  end

  context 'add signature' do
    before do
      @request.add_signature!(Mushikago::Auth::Signer.new('secret_key'))
    end
    subject{ @request['signature'] }
    it{ should == 'sJSFFQREYbNPd2kJK3kuAR3uSgvcbuWtxGFjan+R3w8=' }
  end
end
