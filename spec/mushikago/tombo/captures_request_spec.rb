require 'spec_helper'

describe Mushikago::Tombo::CapturesRequest do
  before :all do
    @request = Mushikago::Tombo::CapturesRequest.new
  end

  subject{ @request }

  it{ should respond_to(:id) }
  it{ should respond_to(:limit) }
  it{ should respond_to(:offset) }
  it{ should respond_to(:domain) }
  it{ should respond_to(:tag) }

  context 'with options' do
    before :all do
      options = {
        :id => 'id',
        :limit => '2',
        :offset => '5',
        :domain => 'hogehoge.com',
        :tag => 'tag',
      }
      @request = Mushikago::Tombo::CapturesRequest.new(options)
    end

    subject{ @request }

    its(:host){ should == Mushikago.config.tombo_endpoint }
    its(:http_method){ should == 'GET' }
    its(:path){ should == '/1/captures.json' }
    its(:id){ should == 'id' }
    its(:limit){ should == '2' }
    its(:offset){ should == '5' }
    its(:domain){ should == 'hogehoge.com' }
    its(:tag){ should == 'tag' }
    its(:url_encoded_params){ should == 'domain=hogehoge.com&id=id&limit=2&offset=5&tag=tag' }
  end
end
