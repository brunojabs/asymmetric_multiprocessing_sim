# encoding: UTF-8
class Master
  def self.enqueue(process)
    slave = "Slave#{rand(1..4)}"
    slave.constantize.create(process: process.id)
  end


  def self.request_io(slave_name)
    data = %w(00110011 1011001 00101000)
    puts "Master: Olá, vou processar o que o ".magenta + slave_name.green + " me enviou\n\n".magenta
    sleep 5
    ret = data.sample
    print "Master: Terminei, #{slave_name}, toma o dado -- #{ret.green} -- \n\n".magenta
    return ret
  end

end