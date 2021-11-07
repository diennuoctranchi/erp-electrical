module Erp
  module Electrical
    module Backend
      class ServicesController < Erp::Backend::BackendController
        before_action :set_service, only: [:move_up, :move_down, :edit, :update, :destroy]

        # GET /services/1
        def list
          @services = Service.search(params).paginate(:page => params[:page], :per_page => 20)
          render layout: nil
        end

        # GET /services/new
        def new
          @service = Service.new
          if request.xhr?
            render '_form', layout: nil, locals: {service: @service}
          end
        end

        # GET /services/1/edit
        def edit
        end

        # POST /services
        def create
          @service = Service.new(service_params)
          @service.creator = current_user
          
          if @service.save
            if request.xhr?
              render json: {status: 'success', text: @service.name, value: @service.id}
            else
              redirect_to erp_electrical.edit_backend_service_path(@service), notice: t('.success')
            end
          else
            if params.to_unsafe_hash['format'] == 'json'
              render '_form', layout: nil, locals: {service: @service}
            else
              render :new
            end            
          end
        end

        # PATCH/PUT /services/1
        def update
          if @service.update(service_params)
            if request.xhr?
              render json: {status: 'success', text: @service.name, value: @service.id}
            else
              redirect_to erp_electrical.edit_backend_service_path(@service), notice: t('.success')
            end
          else
            render :edit
          end
        end

        # DELETE /services/1
        def destroy
          @service.destroy
          respond_to do |format|
            format.html {redirect_to erp_electrical.backend_services_path, notice: t('.success')}
            format.json {render json: {'message': t('.success'), 'type': 'success'}}
          end
        end

        def move_up
          @service.move_up
          respond_to do |format|
            format.json {render json: {}}
          end
        end

        def move_down
          @service.move_down
          respond_to do |format|
            format.json {render json: {}}
          end
        end

        private
          # Use callbacks to share common setup or constraints between actions.
          def set_service
            @service = Service.find(params[:id])
          end

          # Only allow a trusted parameter "white list" through.
          def service_params
            params.fetch(:service, {}).permit(:image, :name, :title, :content, :quotation, :service_category_id, :short_description, :meta_keywords, :meta_description, :tags, :is_best_choice)
          end
      end
    end
  end 
end