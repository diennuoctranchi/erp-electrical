class CreateErpElectricalServiceCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :erp_electrical_service_categories do |t|
      t.string :image
      t.string :icon
      t.string :name
      t.string :title
      t.text :content
      t.integer :parent_id
      t.string :short_description
      t.string :meta_keywords
      t.string :meta_description
      t.string :tags
      t.integer :custom_order
      t.text :cache_search
      t.string :alias
      t.references :creator, index: true, references: :erp_users

      t.timestamps
    end
  end
end