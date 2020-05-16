class CreateCraps < ActiveRecord::Migration[6.0]
  def change
    create_table :craps do |t|
      t.boolean "viewed", default: false
      t.datetime "created_at", null: false
    end
  end
end
