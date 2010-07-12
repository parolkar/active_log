class ActiveLog < ActiveRecord::Base
  belongs_to :ar, :polymorphic => true
  serialize :changed_content, Hash
  
  
end