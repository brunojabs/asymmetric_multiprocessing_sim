namespace :slaves do

  task :destroy => :environment do
    exec "sudo kill -9 `ps aux | grep resque | grep -v grep | awk '{print $2}'`"
  end

  task :run => :environment do
    exec '$SHELL BACKGROUND=yes QUEUE=slave1 rake environment resque:work'
    system 'BACKGROUND=yes QUEUE=slave2 rake environment resque:work'
    system 'BACKGROUND=yes QUEUE=slave3 rake environment resque:work'
    system 'BACKGROUND=yes QUEUE=slave4 rake environment resque:work'
  end

end