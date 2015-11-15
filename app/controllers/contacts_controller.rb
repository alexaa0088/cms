class ContactsController < ApplicationController
 
  layout 'public'
  
  before_action :setup_navigation
   
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      ContactMailer.contact_email(name, email, body).deliver
      redirect_to new_contact_path, notice: "Message sent"
    else
      redirect_to new_contact_path, notice: "Error occured, message has not been sent"
    end
  end
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
    
    def setup_navigation
      @subjects = Subject.visible.sorted
      @pages = Page.visible.sorted
    end

end
