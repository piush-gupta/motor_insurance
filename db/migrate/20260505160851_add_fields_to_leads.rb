class AddFieldsToLeads < ActiveRecord::Migration[8.1]
  def change
    add_column :leads, :previous_policy_expiry_date, :date
    add_column :leads, :idv_preference, :string
  end
end
