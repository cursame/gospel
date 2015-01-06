class AddFinishTrainingToNetwork < ActiveRecord::Migration
  def change
    add_column :networks, :finish_training, :boolean
  end
end
