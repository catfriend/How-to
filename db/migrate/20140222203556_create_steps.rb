class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :stepwriter
      t.text :body
      t.references :tasks, index: true

      t.timestamps
    end
  end
end
