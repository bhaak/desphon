class AutorenlinksController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  #def list
    # @autorenlink_pages, @autorenlinks = paginate :autorenlinks, :per_page => 10
  #end

  #def show
    # @autorenlink = Autorenlink.find(params[:id])
  #end

  def new
    @autorenlink = Autorenlink.new
		if params[:autor] != nil then
			@autorenlink.autor_id = params[:autor]
		end
  end

  def create
    @autorenlink = Autorenlink.new(params[:autorenlink])
    if @autorenlink.save
      flash[:notice] = 'Autorenlink was successfully created.'
      redirect_zum_autor
    else
      render :action => 'new'
    end
  end

  def edit
    @autorenlink = Autorenlink.find(params[:id])
  end

  def update
    @autorenlink = Autorenlink.find(params[:id])
    if @autorenlink.update_attributes(params[:autorenlink])
      flash[:notice] = 'Autorenlink was successfully updated.'
      redirect_zum_autor
    else
      render :action => 'edit'
    end
  end

  def destroy
    @autorenlink = Autorenlink.find(params[:id])
    @autorenlink.destroy
    redirect_zum_autor
  end

  def redirect_zum_autor
    redirect_to :action => 'show', :controller => "autoren", :id => @autorenlink.autor_id
  end
end
