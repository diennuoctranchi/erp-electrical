class CreateErpElectricalFaqs < ActiveRecord::Migration[5.1]
  def change
    create_table :erp_electrical_faqs do |t|
      t.text :question
      t.text :reply
      t.integer :custom_order
      t.references :creator, index: true, references: :erp_users

      t.timestamps
    end
  end
end