# encoding: UTF-8
class Slave3
include Resque::Plugins::Status
  @queue = :slave3

  def perform
    process = FakeProcess.find(options["process"])
    puts "==========================================="
    puts ""
    puts "Slave 3: Olá, vou processar seu #{process.name}"
    prng = Random.new
    time = prng.rand(15..30)
    puts "Slave 3: Vou levar #{time} segundos ok? Aguarde por favor"    
    puts "==========================================="
    sleep time
    puts "Slave 3: Terminei meu trabalho..."
    puts ""
    puts "==========================================="
    process.done = true
    process.save
  end
end