class CreateLeads < ActiveRecord::Migration[8.1]
  def change
    create_table :leads do |t|
      t.string :full_name
      t.string :mobile
      t.string :email
      t.string :vehicle_reg
      t.string :city
      t.string :insurer
      t.string :ncb
      t.string :claims
      t.integer :fraud_score

      t.timestamps
    end
  end
end
