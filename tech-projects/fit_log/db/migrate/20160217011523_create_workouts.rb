class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.text :exercise1
      t.text :exercise2
      t.text :exercise3
      t.text :exercise4
      t.text :exercise5
      t.text :exercise6
      t.datetime :day
      t.string :tag
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :workouts, [:user_id, :created_at]
  end
end
