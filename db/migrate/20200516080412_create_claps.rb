class CreateClaps < ActiveRecord::Migration[6.0]
  def change
    create_table :claps do |t|
      t.boolean "viewed", default: false
      t.datetime "created_at", null: false
    end
  end
end
