class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :industry
      t.text :pitch_text
      t.text :pitch_url
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
