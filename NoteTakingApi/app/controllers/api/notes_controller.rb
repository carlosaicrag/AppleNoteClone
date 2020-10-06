class Api::NotesController < ApplicationController
  def index 
    debugger
    @notes = Note.all
    render json: @notes, status: 200
  end

  def create
    note = Note.new(note_params)

    if note.save!
      render json: note
    else
      render json: note.errors.full_messages, status: 404
    end
  end

  private 
  def note_params
    params.require(:note).permit(:text)
  end
end
