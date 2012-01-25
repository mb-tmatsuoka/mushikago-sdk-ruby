require 'spec_helper'

describe Mushikago::Tombo::CaptureRequest do
  before :all do
    @request = Mushikago::Tombo::CaptureRequest.new('http://www.mushikago.org/')
  end

  subject{ @request }

  it{ should respond_to(:url) }
  it{ should respond_to(:image_format) }
  it{ should respond_to(:image_quality) }
  it{ should respond_to(:thumbnail) }
  it{ should respond_to(:tags) }
  it{ should respond_to(:useragent) }
  it{ should respond_to(:add_signature!) }

  context 'with options' do
    before :all do
      options = {
        :image_format => 'png',
        :image_quality => '20',
        :thumbnail => true,
        :tags => 'hoge,fuga',
        :useragent => 'sampleua',
      }
      @request = Mushikago::Tombo::CaptureRequest.new('http://www.mushikago.org/', options)
    end

    subject{ @request }

    its(:host){ should == Mushikago.config.endpoint }
    its(:http_method){ should == 'POST' }
    its(:path){ should == '/1/capture.json' }
    its(:url){ should == 'http://www.mushikago.org/' }
    its(:image_format){ should == 'png' }
    its(:image_quality){ should == '20' }
    its(:thumbnail){ should == '1' }
    its(:useragent){ should == 'sampleua' }
    its(:tags){ should == 'hoge,fuga' }
    it{ subject.headers['Content-type'].should == 'application/x-www-form-urlencoded; charset=utf-8' }
    its(:url_encoded_params){ should == 'image_format=png&image_quality=20&tags=hoge%2Cfuga&thumbnail=1&url=http%3A%2F%2Fwww.mushikago.org%2F&useragent=sampleua' }
  end

  context 'tags can be array and thumbnail is false' do
    before :all do
      options = {
        :thumbnail => false,
        :tags => ['hoge','fuga'],
      }
      @request = Mushikago::Tombo::CaptureRequest.new('http://www.mushikago.org/', options)
    end

    subject{ @request }
    its(:thumbnail){ should == '0' }
    its(:tags){ should == 'hoge,fuga' }
  end
end
