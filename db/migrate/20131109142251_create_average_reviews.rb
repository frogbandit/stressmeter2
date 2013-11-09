class CreateAverageReviews < ActiveRecord::Migration
  def change
    create_table :average_reviews do |t|
      t.decimal :average_stress
      t.decimal :average_hours
      t.decimal :average_value

      t.timestamps
    end
  end
end
