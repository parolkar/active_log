# Author: Er Abhishek Parolkar

require File.dirname(__FILE__) + '/app/models/active_log'
require File.dirname(__FILE__) + '/lib/sentient_user'
require File.dirname(__FILE__) + '/lib/active_log'

ActiveRecord::Base.send(:include, ParolkarInnovationLab::SocialNet)

ActiveRecord::Base.send(:include, ::ParolkarInnovationLab::SentientUser)



