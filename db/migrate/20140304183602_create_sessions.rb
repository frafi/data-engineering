class CreateSessions < ActiveRecord::Migration
  def change
	create_table :sessions, :force => true do |t|
  		t.text     :data
  		t.timestamps
  	end
  end
end
