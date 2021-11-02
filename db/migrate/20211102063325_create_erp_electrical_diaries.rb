class CreateErpElectricalDiaries < ActiveRecord::Migration[5.1]
  def change
    create_table :erp_electrical_diaries do |t|
      t.string :image
      t.string :name
      t.integer :custom_order
      t.references :creator, index: true, references: :erp_users

      t.timestamps
    end
  end
end