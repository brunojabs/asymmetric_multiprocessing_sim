# encoding: UTF-8
class Slave2
  include Resque::Plugins::Status
  @queue = :slave2

  def perform
    process = FakeProcess.find(options["process"])
    puts "Slave 2: Olá, vou processar seu #{process.name.yellow}\n".green
    prng = Random.new
    time = prng.rand(15..30)
    puts "Slave 2: Vou levar ".green + time.to_s.yellow + " segundos ok? Aguarde por favor\n".green
    sleep time

    if Random.rand(0..30) > 20
      sleep time/2
      puts "Slave 2: Preciso de dados do disco! Vou pedir ao Master e aguardar".green
      data = Master.request_io("Slave2")
      puts "Slave 2: Obrigado Master, me trouxe o dado -- ".green + data.yellow + " --".green
      sleep time/2
    else
      sleep time
    end
    puts "Slave 2: Terminei meu trabalho...\n".green

    process.done = true
    process.save
   end
end