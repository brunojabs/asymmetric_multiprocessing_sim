# encoding: UTF-8
class Slave4
include Resque::Plugins::Status
  @queue = :slave4

  def perform
    process = FakeProcess.find(options["process"])
    puts "Slave 4: Olá, vou processar seu #{process.name.green}\n".yellow
    prng = Random.new
    time = prng.rand(15..30)
    puts "Slave 4: Vou levar ".yellow + time.to_s.green + " segundos ok? Aguarde por favor\n".yellow
    sleep time
    
    if Random.rand(0..30) > 20
      sleep time/2
      puts "Slave 4: Preciso de dados do disco! Vou pedir ao Master e aguardar".yellow
      data = Master.request_io("Slave4")
      puts "Slave 4: Obrigado Master, me trouxe o dado -- ".yellow + data.green + " --".yellow
      sleep time/2
    else
      sleep time
    end

    puts "Slave 4: Terminei meu trabalho...\n".yellow
    process.done = true
    process.save
  end
end