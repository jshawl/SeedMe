class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, class_name: "sender",  index: true, foreign_key: true
      t.references :user, class_name: "receiver", index: true, foreign_key: true
      t.string :subject
      t.text :body

      t.timestamps null: false
    end
  end
end
