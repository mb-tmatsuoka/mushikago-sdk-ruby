require 'spec_helper'

describe Mushikago::Auth::Signer do
  subject{ Mushikago::Auth::Signer.new('secret_key') }
  it{ subject.sign('a').should == 'xkEgZ9jFgFpvfp6KFGd8tGXDZkuS0FGMAsyvyP6YglQ=' }
  it{ subject.sign('b').should == 'RIPOrMecy+TXyaLH2cLiETj4B713c5UD9YVZuOMHVR8=' }
end
