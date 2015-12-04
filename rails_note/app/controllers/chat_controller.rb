class ChatController < ApplicationController
  include ChatHelper
  def index
    if(session[:isLogin]!=true)
      redirect_to :controller => 'auth', :action => 'index'
    end
    getLastNotes
  end

  def reset
    reset_session
    redirect_to :controller => 'auth', :action => 'index'
  end

  def post
    heading = params['input-heading']
    body = params['input-body']
    cl=Client.find_by(:email => session[:email])
    newNote = cl.notes.create(heading: heading,body: body)
    newNote.save
    redirect_to :action => 'index'
  end

  def getLastNotes
    cl=Client.find_by(:email => session[:email])
    q = cl.notes
    @heading = ""
    @body=""
    @notes = []
    j=0
    for q in q
      @heading = q.heading
      @body = q.body
      @id = q.id
      @notes[j] = chat(@heading,@body,@id,j+1)
      j=j+1
    end
  end

  def change
    heading=params['heading']
    body=params['body']
    id = params['input-id'].to_i
    note=Note.find_by(id: id)
    if note
      note.heading = heading
      note.body = body
      note.save
    end
    redirect_to :action => 'index'
  end

  def delete
    id = params['delete-id']
    note = Note.find_by(id: id)
    note.destroy
    redirect_to :action => 'index'
  end

 end
