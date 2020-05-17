class AddHiddenToClap < ActiveRecord::Migration[6.0]
  def up
    add_column :claps, :hidden, :boolean, default: false, null: false
  end

  def down
    remove_column :claps, :hidden, :boolean
  end
end
