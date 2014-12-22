class CreateSessionRegisters < ActiveRecord::Migration
  def change
    create_table :session_registers do |t|
      t.string :email
      t.date :session_date
    end
  end
end
