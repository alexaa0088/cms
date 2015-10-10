class PagesController < ApplicationController
  
  def index
    @pages = Page.sorted
  end
  
  
  def show
    @page = Page.find(params[:id])
  end
  
  
  def new
    @page = Page.new({:name => 'Default'})
  end
  
  def create
    #Instantiate a new page using form parameters
    @page = Page.new(page_params)
    # Save the object
    if @page.save
    # If save succeeds, redirect to the index action
      flash[:notice] = "Page created successfully."
      redirect_to(:action => 'index')
    else
    # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def update
    #Find an existing object using form parameters
    @page = Page.find(params[:id])
    # Update the object
    if @page.update_attributes(page_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Page updated successfully."
      redirect_to(:action => 'show', :id => @page.id)
    else
      # If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end
  
  def delete
    @page = Page.find(params[:id])
  end
  
  def destroy
    page = Page.find(params[:id]).destroy
    flash[:notice] = "Page '#{page.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end
  
  private
  
    def page_params
      params.require(:page).permit(:subjecr_id, :name, :permalink, :visible, :position)
    end

end

