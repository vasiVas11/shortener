class ExpireJob

  @queue = :expire_job_queue

  def self.perform
    Shorter.where(["created_at < ?", Time.now - 2.days]).update_all(:status => '1')

  end

  def self.queue
    self.update
  end

  def self.update
    shorters = Shorter.where(["created_at < ?", Time.now - 2.days], ["user_id =", nil], ["status =", 0]).update_all(:status => '1')
  end
end