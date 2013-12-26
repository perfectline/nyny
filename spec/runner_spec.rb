require 'spec_helper'

describe Runner do
  let (:kls) { mock_app_class {} }

  before do
    kls.optimal_runner.stub :run
  end

  it 'should include the default middleware on top' do
    kls.should_receive(:use).with(Rack::ShowExceptions)
    kls.run!
  end

  it 'should not include show exceptions middleware in production' do
    NYNY.env.stub :production? => true
    kls.should_not_receive(:use)
    kls.run!
  end

end
