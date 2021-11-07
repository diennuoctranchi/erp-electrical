module Erp::Electrical
  class Service < ApplicationRecord
    include Erp::CustomOrder
    mount_uploader :image, Erp::Electrical::ServiceImageUploader

    validates :name, :presence => true
    validates :name, :uniqueness => true
    validates :service_category_id, :presence => true
    validates :title, :presence => true
    validates :title, :uniqueness => true
    validates :title, length: {maximum: 80}

    belongs_to :creator, class_name: 'Erp::User'
    belongs_to :service_category, class_name: 'Erp::Electrical::ServiceCategory'

    def self.filter(query, params)
      params = params.to_unsafe_hash
      and_conds = []
      
			if params["filters"].present?
				params["filters"].each do |ft|
					or_conds = []
					ft[1].each do |cond|
						or_conds << "#{cond[1]["name"]} = '#{cond[1]["value"]}'"
					end
					and_conds << '('+or_conds.join(' OR ')+')' if !or_conds.empty?
				end
			end
			
      if params["keywords"].present?
        params["keywords"].each do |kw|
          or_conds = []
          kw[1].each do |cond|
            or_conds << "LOWER(#{cond[1]["name"]}) LIKE '%#{cond[1]["value"].downcase.strip}%'"
          end
          and_conds << '('+or_conds.join(' OR ')+')'
        end
      end
      
      query = query.joins(:service_category)
      query = query.where(and_conds.join(' AND ')) if !and_conds.empty?
      query = query.joins(:creator)
      
      return query
    end
    
    def self.search(params)
      query = self.all
      query = self.filter(query, params)
      if params[:sort_by].present?
        order = params[:sort_by]
        order += " #{params[:sort_direction]}" if params[:sort_direction].present?
        query = query.order(order)
      end
      return query
    end

    def self.get_active
			self.order('created_at DESC')
		end

    def get_name
      self.name
    end
    
    def get_title
      self.title
    end
		
		def get_service_category_name
      service_category.present? ? service_category.get_name : ''
    end
		
		def get_service_category_full_name
      service_category.present? ? service_category.get_full_name : ''
    end

    after_save :update_cache_search
		after_create :create_alias
		
    def update_cache_search
			str = []
			str << name.to_s.downcase.strip
			self.update_column(:cache_search, str.join(" ") + " " + str.join(" ").to_ascii)
		end
        
    def create_alias
      name = self.name
      self.update_column(:alias, name.to_ascii.downcase.to_s.gsub(/[^0-9a-z \/\-\.]/i, '').gsub(/[ \/\.]+/i, '-').strip)
    end
  end
end