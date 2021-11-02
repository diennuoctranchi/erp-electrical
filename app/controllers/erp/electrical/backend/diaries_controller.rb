module Erp
  module Electrical
    module Backend
      class DiariesController < Erp::Backend::BackendController
        before_action :set_diary, only: [:move_up, :move_down, :edit, :update, :destroy]

        # GET /diaries/1
        def list
          @diaries = Diary.search(params).paginate(:page => params[:page], :per_page => 20)
          render layout: nil
        end

        # GET /diaries/new
        def new
          @diary = Diary.new
          if request.xhr?
            render '_form', layout: nil, locals: {diary: @diary}
          end
        end

        # GET /diaries/1/edit
        def edit
        end

        # POST /diaries
        def create
          @diary = Diary.new(diary_params)
          @diary.creator = current_user
          
          if @diary.save
            if request.xhr?
              render json: {status: 'success', text: @diary.name, value: @diary.id}
            else
              redirect_to erp_electrical.edit_backend_diary_path(@diary), notice: t('.success')
            end
          else
            if params.to_unsafe_hash['format'] == 'json'
              render '_form', layout: nil, locals: {diary: @diary}
            else
              render :new
            end            
          end
        end

        # PATCH/PUT /diaries/1
        def update
          if @diary.update(diary_params)
            if request.xhr?
              render json: {status: 'success', text: @diary.name, value: @diary.id}
            else
              redirect_to erp_electrical.edit_backend_diary_path(@diary), notice: t('.success')
            end
          else
            render :edit
          end
        end

        # DELETE /diaries/1
        def destroy
          @diary.destroy
          respond_to do |format|
            format.html {redirect_to erp_electrical.backend_diaries_path, notice: t('.success')}
            format.json {render json: {'message': t('.success'), 'type': 'success'}}
          end
        end

        def move_up
          @diary.move_up
          respond_to do |format|
            format.json {render json: {}}
          end
        end

        def move_down
          @diary.move_down
          respond_to do |format|
            format.json {render json: {}}
          end
        end

        private
          # Use callbacks to share common setup or constraints between actions.
          def set_diary
            @diary = Diary.find(params[:id])
          end

          # Only allow a trusted parameter "white list" through.
          def diary_params
            params.fetch(:diary, {}).permit()
          end
      end
    end
  end 
end