# encoding: UTF-8
class Slave2
  include Resque::Plugins::Status
  @queue = :slave2

  def perform
     process = FakeProcess.find(options["process"])
    puts "==========================================="
    puts ""
    puts "Slave 2: Olá, vou processar seu #{process.name}"
    prng = Random.new
    time = prng.rand(15..30)
    puts "Slave 2: Vou levar #{time} segundos ok? Aguarde por favor"    
    puts "==========================================="
    sleep time
    puts "Slave 2: Terminei meu trabalho..."
    puts ""
    puts "==========================================="
    process.done = true
    process.save
   end
end