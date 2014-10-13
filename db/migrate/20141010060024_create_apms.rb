class CreateApms < ActiveRecord::Migration
  def change
    create_table :apms do |t|
      t.references :user
      # t.references :admin
      t.timestamps
    end
  end
end
