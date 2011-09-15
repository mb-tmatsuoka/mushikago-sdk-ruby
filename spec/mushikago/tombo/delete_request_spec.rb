require 'spec_helper'

describe Mushikago::Tombo::DeleteRequest do
  before :all do
    @request = Mushikago::Tombo::DeleteRequest.new('391d7fe4-e9d4-4975-85a3-e5d38a4cd97f')
  end

  subject{ @request }

  it{ should respond_to(:id) }
  its(:host){ should == Mushikago.config.tombo_endpoint }
  its(:http_method){ should == 'DELETE' }
  its(:path){ should == '/1/delete.json' }
  its(:id){ should == '391d7fe4-e9d4-4975-85a3-e5d38a4cd97f' }
end

