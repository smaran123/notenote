class NotesController < ApplicationController
 
 before_action :set_note, :except => [:index,:new, :create]
 before_action :authenticate_user!, :except => [:index,:show]
 
  def index
  	@notes = Note.all
  end

  def new
  	@note = Note.new
  end

  def create
  	@note = Note.new(note_params)
  	if @note.save
  		redirect_to notes_path
  	else
  		render :new
  	end
  end


  def edit
  end

  def show
  end
  
   def update
  	if @note.update(note_params)
  		redirect_to notes_path
  	else
  		render :new
  	end
  end
 
 def destroy
 	@note.destroy
 	redirect_to notes_path
 end

private

def set_note
	@note = Note.find(params[:id])
end

def note_params
	params.require(:note).permit!
end

end
