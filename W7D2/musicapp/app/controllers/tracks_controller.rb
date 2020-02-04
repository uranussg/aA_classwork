class TracksController < ApplicationController
    before_action :require_log_in

    # def index 
    #     @tracks = Track.where(album_id:params[:album_id])
    #     render :index
    # end

    def new 
        @track = Track.new
        @albums = Album.all
        @track.album_id = params[:album_id]
        render :new
    end

    def create
        @track = Track.new(track_params)
        # debugger
        if @track.save
            redirect_to track_url(@track)
        else  
            flash[:errors] = @track.errors.full_messages
            redirect_to album_url(@track.album_id)
        end
    end

    def show 
        @track = Track.find_by(id: params[:id])
    
        render :show
    end

    def edit 
        @track = Track.find_by(id:params[:id])
        @albums = Album.all
        render :edit
    end

    def update
        @track = Track.find_by(id:params[:id])
        if @track.update(track_params)
            redirect_to track_url(@track)
        else 
            flash[:errors] = @track.errors.full_messages
            redirect_to track_url(@track)
        end
    end

    def track_params
        params.require(:track).permit(:title, :ord, :lyrics, :album_id, :regular)
    end
end
