require_relative "#{Dir.pwd}/lib/commit_consumer"
require_relative "#{Dir.pwd}/spec/spec_helper"

RSpec.describe CommitConsumer do
  let(:subject) { described_class.commits }

  context '#commits' do
    it 'should be bigger than zero' do
      expect(subject.count).to be > 0
    end

    it 'should return string in the first element' do
      expect(subject[0][0]).to be_an_instance_of(String)
    end
  end
end
