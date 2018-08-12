class WriteFile
  def self.write
    CSV.open(filename, 'wb', {:col_sep => ';'}) do |csv|
      commits.each do |commit|
        csv << commit
      end
    end
  end

  def self.commits
    CommitConsumer.commits
  end

  def self.filename
    "#{Dir.pwd}/output/#{ConfigLoad.new.owner}-#{Time.now.strftime("%Y_%m_%d_%H_%M_%S")}.csv"
  end
end
