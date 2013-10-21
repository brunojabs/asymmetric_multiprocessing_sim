class Master
  def self.enqueue(process)
    slave = "Slave#{rand(1..4)}"
    slave.constantize.create(process: process.id)
  end

end