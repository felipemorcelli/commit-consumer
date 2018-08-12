require 'yaml'

require_relative "#{Dir.pwd}/lib/config_load"
require_relative "#{Dir.pwd}/spec/spec_helper"

RSpec.describe ConfigLoad do
  let(:subject) { described_class.new }

  context 'config' do
    it 'verifies configuration keys' do
      expect(subject.access_token).to be_an_instance_of(String)
      expect(subject.owner).to eq 'Dinda-com-br'
      expect(subject.repository).to eq 'braspag-rest'
    end
  end
end
