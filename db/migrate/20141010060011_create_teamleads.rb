class CreateTeamleads < ActiveRecord::Migration
  def change
    create_table :teamleads do |t|
      t.integer :user_id
      t.references :apm
      t.timestamps
    end
  end
end
