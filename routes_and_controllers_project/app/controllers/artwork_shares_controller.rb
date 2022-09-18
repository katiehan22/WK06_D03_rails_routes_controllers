class ArtworkSharesController < ApplicationController
    def create
        @artworkshare = ArtworkShare.new(artwork_share_params)

        if @artworkshare.save
            render json: @artworkshare
        else
            render json: ["Artwork Share not created"]
        end
    end

    def destroy
        @artworkshare = ArtworkShare.find_by(id: params[:id])
        @artworkshare.destroy
        render json: @artworkshare 
    end

    private
    def artwork_share_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end
