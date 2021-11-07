module Erp
	module Electrical
		module Backend
			class FaqsController < Erp::Backend::BackendController
				before_action :set_faq, only: [:move_up, :move_down, :edit, :update, :destroy]

				# GET /faqs/1
				def list
					@faqs = Faq.search(params).paginate(:page => params[:page], :per_page => 20)
					render layout: nil
				end

				# GET /faqs/new
				def new
					@faq = Faq.new
					if request.xhr?
						render '_form', layout: nil, locals: {faq: @faq}
					end
				end

				# GET /faqs/1/edit
				def edit
				end

				# POST /faqs
				def create
					@faq = Faq.new(faq_params)
					@faq.creator = current_user
					
					if @faq.save
						if request.xhr?
							render json: {status: 'success', text: @faq.name, value: @faq.id}
						else
							redirect_to erp_electrical.edit_backend_faq_path(@faq), notice: t('.success')
						end
					else
						if params.to_unsafe_hash['format'] == 'json'
							render '_form', layout: nil, locals: {faq: @faq}
						else
							render :new
						end            
					end
				end

				# PATCH/PUT /faqs/1
				def update
					if @faq.update(faq_params)
						if request.xhr?
							render json: {status: 'success', text: @faq.name, value: @faq.id}
						else
							redirect_to erp_electrical.edit_backend_faq_path(@faq), notice: t('.success')
						end
					else
						render :edit
					end
				end

				# DELETE /faqs/1
				def destroy
					@faq.destroy
					respond_to do |format|
						format.html {redirect_to erp_electrical.backend_faqs_path, notice: t('.success')}
						format.json {render json: {'message': t('.success'), 'type': 'success'}}
					end
				end

				def move_up
					@faq.move_up
					respond_to do |format|
						format.json {render json: {}}
					end
				end

				def move_down
					@faq.move_down
					respond_to do |format|
						format.json {render json: {}}
					end
				end

				private
					# Use callbacks to share common setup or constraints between actions.
					def set_faq
						@faq = Faq.find(params[:id])
					end

					# Only allow a trusted parameter "white list" through.
					def faq_params
						params.fetch(:faq, {}).permit(:question, :reply)
					end
			end
		end
	end 
end