class ConfigLoad
  attr_accessor :access_token, :owner, :repository

  def initialize
    config = parse_config

    @access_token = config['access_token']
    @owner = config['owner']
    @repository = config['repository']
  end

  private

  def parse_config
    YAML.load_file("#{Dir.pwd}/config/config.yml")
  end
end
