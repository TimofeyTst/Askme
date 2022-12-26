class CreateAnwsers < ActiveRecord::Migration[7.0]
  def change
    create_table :anwsers do |t|
      t.string :body
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
