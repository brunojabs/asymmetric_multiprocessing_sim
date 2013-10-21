# encoding: UTF-8
class Slave4
include Resque::Plugins::Status
  @queue = :slave4

  def perform
     process = FakeProcess.find(options["process"])
    puts "==========================================="
    puts ""
    puts "Slave 4: Olá, vou processar seu #{process.name}"
    prng = Random.new
    time = prng.rand(15..30)
    puts "Slave 4: Vou levar #{time} segundos ok? Aguarde por favor"    
    puts "==========================================="
    sleep time
    puts "Slave 4: Terminei meu trabalho..."
    puts ""
    puts "==========================================="
    process.done = true
    process.save
  end
end