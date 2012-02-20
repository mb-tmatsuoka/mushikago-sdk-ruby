# -*- coding: utf-8 -*-
require 'spec_helper'

describe Mushikago::Tombo::Client do
  before :all do
    @client = Mushikago::Tombo::Client.new(
      :api_key => ENV['MUSHIKAGO_API_KEY'],
      :secret_key => ENV['MUSHIKAGO_SECRET_KEY'],
      :use_ssl => false
    )
  end

  subject{ @client }

  it{ should respond_to(:capture) }
  it{ should respond_to(:captures) }
  it{ should respond_to(:delete) }
  it{ should respond_to(:info) }

  share_examples_for 'Basic response of request' do
    it{ should be_a_kind_of(Mushikago::Http::Response) }
    its(:meta){ should_not be_nil }
    it 'meta status should 200' do subject.meta['status'].should == 200 end
    it 'meta message should "OK"' do subject.meta['message'].should == 'OK' end
    its(:response){ should_not be_nil }
  end

  def create_http_mock(body)
    http = Net::HTTP.new('localhost')
    http.should_receive(:request).and_return do |request|
      response = Net::HTTPOK.new(nil, 200, nil)
      response.stub!(:body).and_return(body)
      response
    end
    Net::HTTP.should_receive(:new).and_return(http)
  end

  context 'send capture request and get mock response' do
    before :all do
      response = {
        :meta => {:status => 200, :message => 'OK'},
        :response => {
          :id => 'image_id',
          :image_url => 'http://img.tombo.ne.jp/sample.jpg',
          :thumbnail_url => 'http://img.tombo.ne.jp/t/sample.jpg'
        }
      }
      create_http_mock(response.to_json)
      @response = @client.capture('http://api.mushikago.org/', :thumbnail=>1)
    end

    subject{ @response }

    it_should_behave_like 'Basic response of request'
    its(['id']){ should == 'image_id'}
    its(['image_url']){ should == 'http://img.tombo.ne.jp/sample.jpg' }
    its(['thumbnail_url']){ should == 'http://img.tombo.ne.jp/t/sample.jpg' }
  end

  context 'send captures request and get mock response' do
    before :all do
      response = {
        :meta => {:status => 200, :message => 'OK'},
        :response => {
          :total => 2,
          :images => [
            {
              :image_id => 'image_id',
              :image_url => 'http://img.tombo.ne.jp/sample.jpg',
              :image_size => 300,
              :source_url => 'http://tombo.mushikago.org/',
              :image_format => 'jpg',
              :image_quality => 80,
              :state => 'requested',
              :tags => ['tag1', 'tag2'],
            },
            {}
          ]
        }
      }
      create_http_mock(response.to_json)
      @response = @client.captures
    end

    subject{ @response }

    it_should_behave_like 'Basic response of request'
    its(['total']){ should == 2 }
    its(['images']){ should be_a_kind_of(Enumerable) }
    its(['images']){ should have_exactly(2).items }

    context 'returned images should have keys' do
      subject{ @response['images'].first }
      its(['image_id']){ should == 'image_id' }
      its(['image_url']){ should == 'http://img.tombo.ne.jp/sample.jpg' }
      its(['image_size']){ should == 300 }
      its(['source_url']){ should == 'http://tombo.mushikago.org/' }
      its(['image_format']){ should == 'jpg' }
      its(['image_quality']){ should == 80 }
      its(['state']){ should == 'requested' }
      its(['tags']){ should be_a_kind_of(Enumerable) }
      its(['tags']){ should have_exactly(2).items }
    end
  end

  context 'send delete request and get mock response' do
    before :all do
      response = {
        :meta => {:status => 200, :message => 'OK'},
        :response => {
          :id => '391d7fe4-e9d4-4975-85a3-e5d38a4cd97f'
        }
      }
      create_http_mock(response.to_json)
      @response = @client.delete('s391d7fe4-e9d4-4975-85a3-e5d38a4cd97f')
    end

    subject{ @response }

    it_should_behave_like 'Basic response of request'
    its(['id']){ should == '391d7fe4-e9d4-4975-85a3-e5d38a4cd97f' }
  end
  
  context 'send info request and get mock response' do
    before :all do
      response = {
        :meta => {:status => 200, :message => 'OK'},
        :response => {
          :api_count => 500,
          :disk_usage => 5500,
          :image_num => 2,
        }
      }
      create_http_mock(response.to_json)
      @response = @client.info
    end

    subject{ @response }

    it_should_behave_like 'Basic response of request'
    its(['api_count']){ should == 500 }
    its(['disk_usage']){ should == 5500 }
    its(['image_num']){ should == 2 }
  end
end
