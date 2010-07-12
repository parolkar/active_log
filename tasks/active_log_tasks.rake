namespace :active_log do
    
    desc 'Sets up parolkar\'s active_log plugin '
    task :setup do
       root = "#{Rails.root}"
      raise 'active_log plugin was only tested on unix & windows' if ! Rake.application.unix? &&  ! Rake.application.windows?

      
      files_to_be_copied = [
        {:source => "/vendor/plugins/active_log/db/migrate/create_activelogs.rb", :target => "/db/migrate/#{migration_timestamp}_create_active_logs.rb" }
        ]
      
     
      FileUtils.mkdir_p("#{root}/db/migrate") unless File.exists?("#{root}/db/migrate")
      files_to_be_copied.each {|ftbc|
        FileUtils.cp_r(root+ftbc[:source], root+ftbc[:target]) #:force => true)
        puts "Created : #{ftbc[:target]}"
      }
      
      puts "Running \"rake db:migrate\" for you..."
      Rake::Task["db:migrate"].invoke
      
     
      
      welcome_screen
     
    end
 
    def migration_timestamp
      sleep (1)
      Time.now.utc.strftime("%Y%m%d%H%M%S")
      
    end  
    
    def welcome_screen
    
    mesg = <<HERE
Congratulations for setting the wonderful plugin! 


HERE

    puts mesg      
    end
    
end
