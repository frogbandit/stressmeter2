class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.decimal :stress_level
      t.decimal :hours_spent
      t.decimal :value

      t.timestamps
    end
  end
end
