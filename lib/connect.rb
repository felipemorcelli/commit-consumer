require 'net/http'
require 'json'

class Connect
  URL = 'https://api.github.com'
  KEY = '3843cf3a6b3b34c950929faaacbe84738574742a'

  def self.get

  end

  def self.parse(body)
    JSON.parse(body)
  end
end
