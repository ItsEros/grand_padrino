require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Billboard Model" do
  it 'can construct a new instance' do
    @billboard = Billboard.new
    refute_nil @billboard
  end
end
