# Inspired by http://github.com/bokmann/sentient_user/blob/master/lib/sentient_user.rb  (Thank you! bokmann)
module ParolkarInnovationLab
  module SentientUser
    def self.included(base)
       base.class_eval {
         def self.current
           Thread.current[:user]
         end

         def self.current=(o)         
           Thread.current[:user] = o
         end

         def make_current
           Thread.current[:user] = self
         end

         def current?
           !Thread.current[:user].nil? && self.id == Thread.current[:user].id
         end
       }
     end
  end

end