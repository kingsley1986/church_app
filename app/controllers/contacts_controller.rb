class ContactsController < ApplicationController

  def new
    @contactform = Contact.new
  end

  def create
    @contactform = Contact.new(params[:contact])
    @contactform.request = request
    if @contactform.deliver
      flash.now[:error] = nil
    else
      flash.now[:error] = "Cannot send message"
      render :new
    end
  end
end
