class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :summary
      t.text :description
      t.timestamps
    end
  end
end
