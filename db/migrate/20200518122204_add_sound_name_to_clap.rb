class AddSoundNameToClap < ActiveRecord::Migration[6.0]
  def up
    add_column :claps, :sound_name, :string
  end

  def down
    remove_column :claps, :sound_name, :string
  end
end
