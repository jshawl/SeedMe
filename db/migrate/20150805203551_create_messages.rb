class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender
      t.string :receiver
      t.string :subject
      t.text :body

      t.timestamps null: false
    end
  end
end
