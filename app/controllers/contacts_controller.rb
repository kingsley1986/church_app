class ContactsController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }


  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      respond_to do |format|
        format.json { render json: @contact }
      end
    else
      flash.now[:error] = "Cannot send message"
      render :new
    end
  end
end
