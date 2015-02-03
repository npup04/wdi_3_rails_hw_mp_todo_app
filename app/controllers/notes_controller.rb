class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def show
  end
  def new
  end
  def edit
  end
  def update
    if @note.update(note_params)
      redirect_to action: :show
    else
      render 'edit'
    end
  end
  def destroy
    @task = Task.find(params[:task_id])
    @note = @task.notes.find(params[:id])
    @note.destroy
    redirect_to action: :show
  end

  private
  def set_note
    @note = Note.find(params[:id])
  end
  def note_params
    params.require(:note).permit(:comment)
  end
end
