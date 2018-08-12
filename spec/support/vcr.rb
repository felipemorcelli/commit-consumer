require 'vcr'
require 'webmock'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
end

RSpec.configure do |config|
  config.around(:each) do |example|
    if example.metada[:vcr]
      name = example.metada[:full_description].split(/\s+/, 2).join('/').underscore.gsub(/\./,'/').gsub(/[^\w\/]+/,'_').gsub(/\$/,'')
      VCR.use_cassette(name, {}, &example)
    else
      VCR.turned_off(&example)
    end
  end
end
