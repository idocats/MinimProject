class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :activity_type
      t.float :distance
      t.float :time
      t.integer :steps

      t.timestamps
    end
  end
end
