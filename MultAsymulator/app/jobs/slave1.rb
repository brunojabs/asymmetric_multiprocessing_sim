# encoding: UTF-8
class Slave1
  include Resque::Plugins::Status
  @queue = :slave1

  def perform
    process = FakeProcess.find(options["process"])
    puts "Slave 1: Olá, vou processar seu #{process.name.green}\n".red
    prng = Random.new
    time = prng.rand(15..30)
    puts "Slave 1: Vou levar ".red + time.to_s.green + " segundos ok? Aguarde por favor\n".red
    sleep time

    # if [true, false].sample
      sleep time/2
      puts "Slave 1: Preciso de dados do disco! Vou pedir ao Master e aguardar".red
      data = Master.request_io("Slave1")
      puts "Slave 1: Obrigado Master, me trouxe o dado -- ".red + data.green + " --".red
      sleep time/2
    # else
      # sleep time
    # end

    puts "Slave 1: Terminei meu trabalho...\n".red

    process.done = true
    process.save
  end
end