# encoding: UTF-8
class Slave3
  @queue = :slave3

  def self.perform(process_id)
    process = FakeProcess.find(process_id)
    puts "==========================================="
    puts ""
    puts "Ola, sou o slave 3, vou processar seu #{process.name}"
    prng = Random.new
    time = prng.rand(15..30)
    puts "Vou levar #{time} segundos ok? Aguarde por favor"
    sleep time
    puts "Olha só, terminei de processar o #{process.name}"
    puts ""
    puts "==========================================="
    process.done = true
    process.save
  end
end