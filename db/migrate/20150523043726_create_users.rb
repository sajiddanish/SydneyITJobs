class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.text :experstise
      t.string :experience 
      t.text :skills
      t.string :location
      t.timestamps
    end
  end
end
