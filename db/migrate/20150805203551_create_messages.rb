class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :sender
      t.references :receiver
      t.string :subject
      t.text :body

      t.timestamps null: false
    end
  end
end
