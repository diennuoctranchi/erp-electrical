module Erp::Electrical
  class Faq < ApplicationRecord
    include Erp::CustomOrder

    validates :question, :presence => true
    validates :question, :uniqueness => true
    validates :reply, :presence => true
    validates :reply, :uniqueness => true

    belongs_to :creator, class_name: 'Erp::User'

    def get_question
			self.question
		end

    def get_reply
			self.reply
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
  end
end