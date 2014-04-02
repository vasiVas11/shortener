class ExpireJob

  def self.perform

    shorters = Shorter.where(["created_at < ?", Time.now - 2.days]).update_all(:status => '1')

  end

end