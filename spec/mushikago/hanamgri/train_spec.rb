# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Hanamgri::TrainRequest do
  before :all do
    @training_data = Mushikago::Hanamgri::TrainingData.new do
      put("name", "株式会社マイニングブラウニー")
      put("address", "東京都中央区日本橋浜町１−２−３")
      put("tel", "03-6206-2812")
    end
  end

  shared_examples_for 'a valid train instance' do |domain_name, url_or_html|
    subject{ Mushikago::Hanamgri::TrainRequest.new(domain_name, url_or_html, @training_data) }
    it{ should be_kind_of(Mushikago::Http::PostRequest) }
    its(:path){ should == "/1/hanamgri/domains/#{domain_name}/train" }
    its(:domain_name){ should == domain_name }
    its(:url_or_html){ should == url_or_html }
    its(:training_data){ should == @training_data.to_json }
  end

  test_parameters = [
    ['domain_name', 'http://www.mushikago.org'],
    ['domain_name', '<div>hello mushikago</div>'],
  ].each do |domain_name, url|
    context ".new(#{domain_name}, #{url})" do
      it_should_behave_like 'a valid train instance', domain_name, url
    end
  end
end

