module ParolkarInnovationLab
  module SocialNet
    def self.included(base)
      base.extend ParolkarInnovationLab::SocialNet::ClassMethods
    end
    
    module ClassMethods
      def records_active_log(arg_hash={}) 
              include ParolkarInnovationLab::SocialNet::InstanceMethods
              before_save :record_changes_for_active_log
              after_save :save_active_log    
              has_many :active_logs, :as => :ar
      end
    end  
    
    module InstanceMethods
      private
        def record_changes_for_active_log
          @copy_of_changes = changes
        end
        def save_active_log
          log = ActiveLog.new
          log.ar = self
          log.changed_content = @copy_of_changes
          log.meta_data = {:session_user_id => ActiveLog.current.id} unless ! ActiveLog.current # How does this work? Well.. You gotta put a before_filter in application controller which assigns ActiveLog.current = current_user
          log.save!
        end   
    end
  end
 end  
