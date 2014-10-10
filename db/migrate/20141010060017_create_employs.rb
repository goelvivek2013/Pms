class CreateEmploys < ActiveRecord::Migration
  def change
    create_table :employs do |t|
      t.integer :user_id
      t.references :teamlead
      t.timestamps
    end
  end
end
