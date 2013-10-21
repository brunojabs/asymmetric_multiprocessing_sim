# encoding: UTF-8
class Slave1
  include Resque::Plugins::Status
  @queue = :slave1

  def perform
    process = FakeProcess.find(options["process"])
    puts "==========================================="
    puts ""
    puts "Slave 1: Olá, vou processar seu #{process.name}"
    prng = Random.new
    time = prng.rand(15..30)
    puts "Slave 1: Vou levar #{time} segundos ok? Aguarde por favor"    
    puts "==========================================="
    sleep time
    puts "Slave 1: Terminei meu trabalho..."
    puts ""
    puts "==========================================="
    process.done = true
    process.save
  end
end