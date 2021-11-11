module Erp::Electrical
  class Diary < ApplicationRecord
    include Erp::CustomOrder
    mount_uploader :image, Erp::Electrical::DiaryImageUploader

    validates :name, :presence => true
    validates :name, :uniqueness => true
    belongs_to :creator, class_name: 'Erp::User'

    def get_name
			self.name
		end
    
    def self.search(params)
      query = self.all
      if params[:sort_by].present?
        order = params[:sort_by]
        order += " #{params[:sort_direction]}" if params[:sort_direction].present?
        query = query.order(order)
      end
      return query
    end

    after_save :create_alias
        
    def create_alias
      name = self.name
      self.update_column(:alias, name.to_ascii.downcase.to_s.gsub(/[^0-9a-z \/\-\.]/i, '').gsub(/[ \/\.]+/i, '-').strip)
    end
  end
end