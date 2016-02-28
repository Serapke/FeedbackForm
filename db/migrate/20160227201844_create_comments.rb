class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.string :phone
      t.string :email
      t.string :content

      t.timestamps null: false
    end
  end
end
