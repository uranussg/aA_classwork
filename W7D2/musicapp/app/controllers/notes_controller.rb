class NotesController < ApplicationController
    def destroy
        @note = Note.find_by(id:params[:id])
        if @note.user_id == current_user.id
            @note.destroy
            redirect_to track_url(@note.track_id)
        else     
            flash[:errors] = ["You can only delete your own note"]
            redirect_to track_url(@note.track_id)
        end
    end
    
    def create
        # debugger
        @note = Note.new(note_params)
        @note.track_id = params[:track_id]
        @note.user_id = current_user.id
        # debugger
        if @note.save 
            # debugger
            redirect_to track_url(params[:track_id])
        else       
            flash[:errors] = @note.errors.full_messages
        end
    end

    def note_params
        params.require(:note).permit(:body)
    end
end
