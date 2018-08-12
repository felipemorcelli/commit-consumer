gem 'pry', require: false

require 'csv'
require 'json'
require 'net/http'
require 'openssl'
require 'pry'
require 'yaml'

class CommitConsumer
  URL = 'https://api.github.com'.freeze

  def self.config
    ConfigLoad.new
  end

  def self.commits
    uri = URI("#{URL}/repos/#{config.owner}/#{config.repository}/contributors")
    create_lines(sort_commits(parse(access(uri))))
  end

  def self.access(uri)
    begin
      Net::HTTP.start(uri.host, uri.port,
        :use_ssl => uri.scheme == 'https',
        :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|

        request = Net::HTTP::Get.new(uri.request_uri)
        request.basic_auth config.access_token, 'x-oauth-basic'
        response = http.request(request)
        response.body
      end
    rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
           Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
    end
  end

  def self.sort_commits(body)
    body.sort_by { |k| -k['contributions'] }
  end

  def self.create_lines(body)
    contributors = []
    body.each do |commit|
      user = user_info(commit['login'])
      contributors << [user['name'], user['email'].to_s, user['login'], user['avatar_url'].to_s,
                       commit['contributions']]
    end
    contributors
  end

  def self.user_info(user)
    parse(access(URI("#{URL}/users/#{user}")))
  end

  def self.parse(body)
    JSON.parse(body)
  end
end
