class AddFinishTrainingToUser < ActiveRecord::Migration
  def change
    add_column :users, :finish_training, :boolean, default: false
  end
end
