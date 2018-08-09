require 'net/http'
require 'json'
require 'yaml'

class CommitConsumer
  URL = 'https://api.github.com'

  def self.read_commits
    
  end

  def self.parse_commits(body)
    JSON.parse(body)
  end
end
