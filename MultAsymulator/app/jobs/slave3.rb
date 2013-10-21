# encoding: UTF-8
class Slave3
include Resque::Plugins::Status
  @queue = :slave3

  def perform
    process = FakeProcess.find(options["process"])
    puts "Slave 3: Olá, vou processar seu #{process.name.green}\n".blue
    prng = Random.new
    time = prng.rand(15..30)
    puts "Slave 3: Vou levar ".blue + time.to_s.green + " segundos ok? Aguarde por favor\n".blue
    sleep time

    if Random.rand(0..30) > 20
      sleep time/2
      puts "Slave 3: Preciso de dados do disco! Vou pedir ao Master e aguardar".blue
      data = Master.request_io("Slave3")
      puts "Slave 3: Obrigado Master, me trouxe o dado -- ".blue + data.green + " --".blue
      sleep time/2
    else
      sleep time
    end
    puts "Slave 3: Terminei meu trabalho...\n".blue

    process.done = true
    process.save
  end
end