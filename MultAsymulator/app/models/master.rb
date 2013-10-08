class Master
  def self.enqueue(process)
    slave = "Slave#{rand(1..4)}"
    Resque.enqueue(slave.constantize, process.id)
  end

end