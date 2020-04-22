class CreateResidents < ActiveRecord::Migration[6.0]
  def change
    create_table :residents do |t|
      t.string :name
      t.string :email
      t.string :telephone
      t.belongs_to :apartment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
