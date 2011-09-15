require 'spec_helper'

class SampleRequest < Mushikago::Http::Request
  add_param :sample1
  add_param :sample2 do |v| v.to_i end
  add_param :sample3 do |v| 'sample3' end
end

describe Mushikago::Http::Request do
  before :all do
    @request = Mushikago::Http::Request.new
    @request.host = 'tombo.ap-northeast-1.mushikago.org'
    @request.path = '/1/list.json'
    @request.headers['hoge'] = 'fuga'
    @request['param1'] = 'p1'
    @request['param2'] = 'p2'
    @request['timestamp'] = '2011-09-01T00:00:00Z'
  end

  subject{ @request }
  
  it{ should respond_to(:http_method) }
  it{ should respond_to(:host, :host=) }
  it{ should respond_to(:port, :port=) }
  it{ should respond_to(:path, :path=) }
  it{ should respond_to(:headers) }
  it{ should respond_to(:params) }
  it{ should respond_to(:[]=) }
  it{ should respond_to(:[]) }

  its(:http_method){ should == 'GET' }
  its(:host){ should == 'tombo.ap-northeast-1.mushikago.org' }
  its('port.to_i'){ should == 80 }
  its(:path){ should == '/1/list.json' }
  its(:headers){ should be_a_kind_of(Hash) }
  it 'header["hoge"] should "fuga"' do subject.headers['hoge'].should == 'fuga' end
  its(['param1']){ should == 'p1' }
  its(['param2']){ should == 'p2' }
  its(['timestamp']){ should == '2011-09-01T00:00:00Z' }

  its(:url_encoded_params){ should == 'param1=p1&param2=p2&timestamp=2011-09-01T00%3A00%3A00Z' }

  context 'to http request' do
    subject{ @request.to_http_request }
    it{ should be_a_kind_of(Net::HTTPRequest) }
  end

  context 'extend with add_param' do
    before :all do
      @request = SampleRequest.new
      @request.sample1 = 'hoge'
      @request.sample2 = '20'
      @request.sample3 = 'fuga'
    end

    subject{ @request }

    it{ should respond_to(:sample1, :sample1=) }
    it{ should respond_to(:sample2, :sample2=) }
    it{ should respond_to(:sample3, :sample3=) }

    its(:sample1){ should == 'hoge' }
    its(:sample2){ should == 20 }
    its(:sample3){ should == 'sample3' }
  end
end

