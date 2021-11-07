class AddAliasToErpElectricalDiaries < ActiveRecord::Migration[5.1]
  def change
    add_column :erp_electrical_diaries, :alias, :string
  end
end