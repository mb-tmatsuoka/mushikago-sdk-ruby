# -*- coding: utf-8 -*-
require 'spec_helper'

describe Mushikago::Config do
  # Mushikago::Configはシングルトンである
  context 'is singleton class' do
    subject{ Mushikago::Config.instance }
    it{ should == Mushikago::Config.instance }

    # 直接newすることはできない
    context 'and cannot call new' do
      subject{ proc{ Mushikago::Config.new } }
      it{ should raise_error }
    end
  end

  # Mushikago::Configは以下のキーを持っている
  context 'has keys' do
    subject{ Mushikago::Config.instance }
    it{ should respond_to(:api_key) }
    it{ should respond_to(:secret_key) }
    it{ should respond_to(:endpoint) }
  end

  # Mushikago::Configはデフォルトの値を持っている
  context 'has default value' do
    subject{ Mushikago::Config.instance }
    its(:api_key){ should == (ENV['MUSHIKAGO_API_KEY'] || ENV['MUSHIKAGO_API_KEY_ID']) }
    its(:secret_key){ should == (ENV['MUSHIKAGO_SECRET_KEY'] || ENV['MUSHIKAGO_SECRET_ACCESS_KEY']) }
    its(:endpoint){ should == 'api.mushikago.org' }
  end

  # Mushikago::Configは値をロードすることができる
  context 'loads option value' do
    before :all do
      Mushikago::Config.instance.load(
        :api_key => 'api_key',
        :secret_key => 'secret_key',
        :endpoint => 'tombo.mushikago.org'
      )
    end
    
    subject{ Mushikago::Config.instance }
    its(:api_key){ should == 'api_key' }
    its(:secret_key){ should == 'secret_key' }
    its(:endpoint){ should == 'tombo.mushikago.org' }

    # ロードする際のキーは文字列でもOK
    context 'loading options key can be string' do
      before :all do
        Mushikago::Config.instance.load(
          'api_key' => 'api_key',
          'secret_key' => 'secret_key',
          'endpoint' => 'tombo.mushikago.org'
        )
      end

      subject{ Mushikago::Config.instance }
      its(:api_key){ should == 'api_key' }
      its(:secret_key){ should == 'secret_key' }
      its(:endpoint){ should == 'tombo.mushikago.org' }
    end
  end

end
