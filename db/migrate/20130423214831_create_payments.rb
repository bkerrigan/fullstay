class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :method
      t.float :amount_paid
      t.float :amount_due

      t.timestamps
    end
  end
end
