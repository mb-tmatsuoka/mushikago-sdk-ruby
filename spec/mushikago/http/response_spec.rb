require 'spec_helper'

describe Mushikago::Http::Response do
  before do
    response = {
      :meta => {
        :status => 200,
        :message => 'OK'
      },
      :response => {
        :hello => 'world'
      }
    }
    @response = Mushikago::Http::Response.new(response)
  end

  subject{ @response }

  it{ should respond_to(:meta, :response) }
  it{ should respond_to(:status, :message) }
  it{ should respond_to(:[]) }

  it{ subject.meta[:status].should == 200 }
  its(:status){ should == 200 }
  it{ subject.meta[:message].should == 'OK' }
  its(:message){ should == 'OK' }
  it{ subject.response[:hello].should == 'world' }
  its([:hello]){ should == 'world' }
end
