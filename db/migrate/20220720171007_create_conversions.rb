class CreateConversions < ActiveRecord::Migration[7.0]
  def change
    create_table :conversions do |t|
      t.string :base_currency
      t.string :target_currency
      t.integer :conv_count
      t.date :conv_date

      t.timestamps
    end
  end
end
