class ArtworksController < ApplicationController
    def index
        # debugger
        # if params.has_key?(:user_id)
        #     @artworks = Artwork.where(artist_id: params[:user_id])
        # else
        #     @artworks = Artwork.all
        # end
        @artworks = Artwork.artworks_for_user_id(params[:user])
        render json: @artworks 
    end

    def show 
        @artwork = Artwork.find_by(id: params[:id])
        render json: @artwork 
    end

    def create 
        # debugger
        @artwork = Artwork.new(artwork_params)

        if @artwork.save 
            redirect_to artwork_url(@artwork)
        else
            render json: ["Artwork not created"]
        end
    end

    def destroy
        @artwork = Artwork.find_by(id: params[:id])
        @artwork.destroy 
        redirect_to artworks_url
    end

    def update
        @artwork = Artwork.find_by(id: params[:id])

        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    private 
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end

end
