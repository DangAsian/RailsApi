class V1::ContactsController < ApplicationController
  def index
     @contacts = Contact.all
     # byebug
     #jbuilder alows us to render a json view which will help with scability
     #instead of :
     # render json: @contacts, status: :ok
     render :index, status: :ok
   end

   def create
     @contact = Contact.new(contact_params)

     @contact.save
     render :create, status: :created
   end

   def destroy
     @contact = Contact.where(id: params[:id]).first

     if @contact.destroy
      head(:ok)
    else
      head(unprocessable_entity)
    end
  end

   private

   def contact_params
     params.require(:contact).permit(:first_name, :last_name, :email)
   end

end
