class AddHashTagToClap < ActiveRecord::Migration[6.0]
  def up
    add_column :claps, :hash_tag, :string
  end

  def down
    remove_column :claps, :hash_tag, :string
  end
end
