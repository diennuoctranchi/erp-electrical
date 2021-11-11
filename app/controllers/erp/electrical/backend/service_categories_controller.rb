module Erp
  module Electrical
    module Backend
      class ServiceCategoriesController < Erp::Backend::BackendController
        before_action :set_service_category, only: [:move_up, :move_down, :edit, :update, :destroy]

        # GET /service_categories/1
        def list
          @service_categories = ServiceCategory.search(params).paginate(:page => params[:page], :per_page => 20)
          render layout: nil
        end

        # GET /service_categories/new
        def new
          @service_category = ServiceCategory.new
          if request.xhr?
            render '_form', layout: nil, locals: {service_category: @service_category}
          end
        end

        # GET /service_categories/1/edit
        def edit
        end

        # POST /service_categories
        def create
          @service_category = ServiceCategory.new(service_category_params)
          @service_category.creator = current_user
          
          if @service_category.save
            if request.xhr?
              render json: {status: 'success', text: @service_category.name, value: @service_category.id}
            else
              redirect_to erp_electrical.edit_backend_service_category_path(@service_category), notice: t('.success')
            end
          else
            if params.to_unsafe_hash['format'] == 'json'
              render '_form', layout: nil, locals: {service_category: @service_category}
            else
              render :new
            end            
          end
        end

        # PATCH/PUT /service_categories/1
        def update
          if @service_category.update(service_category_params)
            if request.xhr?
              render json: {status: 'success', text: @service_category.name, value: @service_category.id}
            else
              redirect_to erp_electrical.edit_backend_service_category_path(@service_category), notice: t('.success')
            end
          else
            render :edit
          end
        end

        # DELETE /service_categories/1
        def destroy
          @service_category.destroy
          respond_to do |format|
            format.html {redirect_to erp_electrical.backend_service_categories_path, notice: t('.success')}
            format.json {render json: {'message': t('.success'), 'type': 'success'}}
          end
        end

        def dataselect
          respond_to do |format|
            format.json {render json: ServiceCategory.dataselect(params[:keyword])}
          end
        end

        def move_up
          @service_category.move_up
          respond_to do |format|
            format.json {render json: {}}
          end
        end

        def move_down
          @service_category.move_down
          respond_to do |format|
            format.json {render json: {}}
          end
        end

        private
          # Use callbacks to share common setup or constraints between actions.
          def set_service_category
            @service_category = ServiceCategory.find(params[:id])
          end

          # Only allow a trusted parameter "white list" through.
          def service_category_params
            params.fetch(:service_category, {}).permit(:image, :icon, :name, :title, :content, :parent_id, :short_description, :meta_keywords, :meta_description, :tags)
          end
      end
    end
  end 
end