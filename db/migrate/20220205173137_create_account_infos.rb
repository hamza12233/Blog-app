class CreateAccountInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :account_infos do |t|
      t.references :user
      t.integer :name_on_card
      t.string :card_number
      t.string :expiry_month
      t.string :expiry_year
      t.float :amount

      t.timestamps
    end
  end
end