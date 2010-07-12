class CreateActiveLogs < ActiveRecord::Migration
   def self.up
   create_table :active_logs do |t|
     t.string :type
     t.integer :ar_id
     t.string :ar_type
     t.text :changed_content
     t.text :meta_data
     t.datetime :expiry
     t.timestamps
   end
 end

 def self.down
   drop_table :active_logs
 end
end