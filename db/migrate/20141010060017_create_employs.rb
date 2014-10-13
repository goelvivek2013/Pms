class CreateEmploys < ActiveRecord::Migration
  def change
    create_table :employs do |t|
      t.references :user
      t.references :teamlead
      t.timestamps
    end
  end
end
