require_relative "#{Dir.pwd}/lib/commit_consumer"
require_relative "#{Dir.pwd}/lib/write_file"
require_relative "#{Dir.pwd}/spec/spec_helper"

RSpec.describe WriteFile do
  let(:subject) { described_class }

  context '#write' do
    it 'should write csv file' do
      @buffer = StringIO.new()
      @filename = "#{Dir.pwd}/spec/output.csv"
      @content = "Felipe Morcelli;felipemorcelli@gmail.com;fmorcelli;;0;"

      allow(File).to receive(:open).with(@filename,'w').and_yield(@buffer)
      File.open(@filename, 'w') {|f| f.write(@content)}

      expect(@buffer.string).to eq(@content)
    end

    it 'should write' do
      expect(subject.write).to be_an_instance_of(Array)
    end
  end

  context '#commits' do
    let(:commits) { subject.commits }

    it 'must be bigger than zero' do
      expect(commits.count).to be > 0
      expect(commits[0][0]).to be_an_instance_of(String)
    end
  end

  context '#filename' do
    before do
      @filename = subject.filename
    end

    it 'must be a non empty string' do
      expect(@filename).to be_an_instance_of(String)
    end

    it 'must have the right filename' do
      expect(@filename).to eq "#{Dir.pwd}/output/#{ConfigLoad.new.owner}-#{Time.now.strftime("%Y_%m_%d_%H_%M_%S")}.csv"
    end
  end
end
