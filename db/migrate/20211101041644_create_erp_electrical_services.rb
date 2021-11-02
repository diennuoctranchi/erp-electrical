class CreateErpElectricalServices < ActiveRecord::Migration[5.1]
  def change
    create_table :erp_electrical_services do |t|
      t.string :image
      t.string :name
      t.string :title
      t.text :content
      t.text :quotation
      t.string :short_description
      t.boolean :is_best_choice, default: false
      t.string :meta_keywords
      t.string :meta_description
      t.string :tags
      t.integer :custom_order
      t.text :cache_search
      t.string :alias
      t.references :service_category, index: true, references: :erp_electrical_service_categories
      t.references :creator, index: true, references: :erp_users

      t.timestamps
    end
  end
end