module Erp::Electrical
  class ServiceCategory < ApplicationRecord
    include Erp::CustomOrder
    mount_uploader :image, Erp::Electrical::ServiceCategoryImageUploader
    mount_uploader :icon, Erp::Electrical::ServiceCategoryIconUploader

    validates :name, :presence => true
    validates :name, :uniqueness => true
    validates :title, :presence => true
    validates :title, :uniqueness => true
    validates :title, length: {maximum: 80}

    belongs_to :creator, class_name: 'Erp::User'
    belongs_to :parent, class_name: 'Erp::Electrical::ServiceCategory', optional: true
    has_many :children, class_name: 'Erp::Electrical::ServiceCategory', foreign_key: 'parent_id'
    has_many :services, class_name: 'Erp::Electrical::Service'

    def self.filter(query, params)
      params = params.to_unsafe_hash
      and_conds = []
			
      if params["keywords"].present?
        params["keywords"].each do |kw|
          or_conds = []
          kw[1].each do |cond|
            or_conds << "LOWER(#{cond[1]["name"]}) LIKE '%#{cond[1]["value"].downcase.strip}%'"
          end
          and_conds << '('+or_conds.join(' OR ')+')'
        end
      end
      
      query = query.joins("LEFT JOIN erp_electrical_service_categories parents_erp_electrical_service_categories ON parents_erp_electrical_service_categories.id = erp_electrical_service_categories.parent_id")

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
    
    def self.dataselect(keyword='')
      query = self.all
      if keyword.present?
        keyword = keyword.strip.downcase
        query = query.where('LOWER(cache_search) LIKE ?', "%#{keyword}%")
      end
      query = query.limit(20).map{|service_category| {value: service_category.id, text: service_category.get_full_name}}
    end

    def get_full_name
			names = [self.name]
			p = self.parent
			while !p.nil? do
				names << p.name
				p = p.parent
			end
			names.reverse.join(" >> ")
		end

    def get_title
			self.title
		end

    def get_name
			self.name
		end

    def get_parent_name
			self.parent.present? ? self.parent.get_full_name : ''
		end

    def get_self_and_children_ids
      ids = [self.id]
      ids += get_children_ids_recursive
      return ids
		end

    def get_children_ids_recursive
      ids = []
      children.each do |c|
				if !c.children.empty?
					ids += c.get_children_ids_recursive
				end
				ids << c.id
			end
      return ids
		end

    after_save :update_cache_search
    after_save :create_alias
    
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