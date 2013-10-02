# encoding: UTF-8
class Slave
  @queue = :slave

  def self.perform(process_id)
    process = FakeProcess.find(process_id)
    puts "Estou processando o processo #{process.name}"
    prng = Random.new
    time = prng.rand(15..30)
    puts "Vou levar #{time} segundos"
    sleep time
    puts "Olha só, terminei de processar o #{process.name}"
    process.done = true
    process.save
  end
end