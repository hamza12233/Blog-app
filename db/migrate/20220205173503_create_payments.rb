class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.float :amount
      t.references :sender_account, index: true, foreign_key: {to_table: :account_infos}
      t.references :recipient_account, index: true, foreign_key: {to_table: :account_infos}

      t.timestamps
    end
  end
end
