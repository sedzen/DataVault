module Api
  module V1
    class StoredDataController < ApiController
      respond_to :json

      def index
        respond_with StoredData.where(:application_id => @client_app)
      end

      def show
        respond_with StoredData.where(:id => params[:id])
      end

      def create
        respond_with @client_app.stored_datas.create(params[:stored_datum])
      end

      def update
        @res = StoredData.where(params[:id])
        respond_with @res.update_all(params[:stored_data])
        #respond_with StoredData.update(params[:id], params[:stored_data])
      end

      def destroy
        respond_with StoredData.destroy(params[:id])
      end
    end
  end
end