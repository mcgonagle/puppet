require 'spec_helper'
describe 'cje' do

  context 'with defaults for all parameters' do
    it { should contain_class('cje') }
  end
end
