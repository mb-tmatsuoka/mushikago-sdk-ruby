# -*- coding : utf-8 -*-
require 'spec_helper'

describe Mushikago::Hanamgri::TrainRequest do
  before :all do
    @training_data = Mushikago::Hanamgri::TrainingData.new do
      add Mushikago::Hanamgri::Element.new("会社名", "株式会社マイニングブラウニー")
      add Mushikago::Hanamgri::Element.new("住所", "東京都中央区日本橋浜町１−２−３")
      add Mushikago::Hanamgri::Element.new("電話番号", "03-6206-2812")
    end
  end

  shared_examples_for 'a valid train instance' do |domain_name, html|
    subject{ Mushikago::Hanamgri::TrainRequest.new(domain_name, html, @training_data) }
    it{ should be_kind_of(Mushikago::Http::PostRequest) }
    its(:path){ should == "/1/hanamgri/domains/#{domain_name}/train" }
    its(:domain_name){ should == domain_name }
    its(:html){ should == html }
    its(:training_data){ should == @training_data.to_json }
  end

  test_parameters = [
    ['domain_name', '<div>test html</div>'],
  ].each do |domain_name, html|
    context ".new(#{domain_name}, #{html})" do
      it_should_behave_like 'a valid train instance', domain_name, html
    end
  end
end

