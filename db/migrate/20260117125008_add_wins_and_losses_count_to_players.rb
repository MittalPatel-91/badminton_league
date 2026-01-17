class AddWinsAndLossesCountToPlayers < ActiveRecord::Migration[8.1]
  def up
    add_column :players, :wins_count, :integer, null: false, default: 0
    add_column :players, :losses_count, :integer, null: false, default: 0
  end

  def down
    remove_column :players, :wins_count
    remove_column :players, :losses_count
  end
end
