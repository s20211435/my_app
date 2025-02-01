class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :status
      t.datetime :due_date
      t.references :user, foreign_key: true
      t.references :task , foreign_key: true

      t.timestamps
    end
  end
end
