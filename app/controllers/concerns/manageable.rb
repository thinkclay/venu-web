#
# Consolidated CMS-like Functionality
#
module Manageable
  extend ActiveSupport::Concern

  included do
    before_action :identify_model
    before_action :set_resource, only: [:show, :edit, :update, :destroy]
    before_action :authorize_action, only: [:create, :new, :index, :edit, :update, :destroy, :manage]

    def index
      if @topic == :all
        @resources = @model.published.sorted
      else
        @resources = @model.where(topic: @topic).published.sorted
      end

      respond_to do |format|
        format.html { render :index }
        format.rss { render layout: false }
      end
    end

    def show
    end

    # Admin Only
    def create
      @resource = @model.new(allowed_params)

      if @resource.save
        redirect_to @resource, notice: t('resource.created')
      else
        render :new
      end
    end

    def new
      @resource = @model.new
    end

    def edit
    end

    def update
      if @resource.update(allowed_params)
        redirect_to @resource, notice: t('resource.updated')
      else
        render :edit
      end
    end

    def destroy
      @resource.destroy
      redirect_to polymorphic_path(@resource), notice: t('resource.deleted')
    end

    private

    def identify_model
      @model = params[:resource].constantize
    end

    def authorize_action
      @resource ||= @model.new
      authorize! params['action'].to_sym, @resource, message: t('error.unauthorized')
    end

    # Use callbacks to share common setup or constraints between actions.
    # Find by permalink OR id
    # Resource is defined in routes file as a default param
    def set_resource
      klass = @model
      @resource = klass.find(params[:id])
    end

    def publishable_params
      []
    end
  end
end
