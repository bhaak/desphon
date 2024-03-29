class AutorenController < ApplicationController

  layout 'application'

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  before_filter :redirect_to_homepage, :except => [:list, :show, :index]

  def list
    # @autor_pages, @autoren = paginate :autoren, :per_page => 20, :order => 'nachname, vorname'
    last_modified = Autor.find_by_sql("SELECT max(updated_at) as updated_at from Autoren")[0].updated_at

    response.headers['Last-Modified'] = last_modified.httpdate if in_production?

    minTime = Time.rfc2822(request.env["HTTP_IF_MODIFIED_SINCE"]) rescue nil
    if minTime and last_modified <= minTime 
      render :nothing => true, :status => 304
    else
      @autoren = Autor.find(:all, :order => 'nachname, vorname')
    end
  end

  def show
    @autor = Autor.find(params[:id])
    minTime = Time.rfc2822(request.env["HTTP_IF_MODIFIED_SINCE"]) rescue nil

    response.headers['Last-Modified'] = @autor.updated_at.httpdate if in_production?

    if minTime and @autor.updated_at <= minTime 
      render :nothing => true, :status => 304
    end

  end

  def new
    @autor = Autor.new
  end

  def create
    cache_loeschen
    @autor = Autor.new(params[:autor])
    if @autor.save
      flash[:notice] = 'Autor was successfully created.'
      redirect_to :action => 'show', :id => @autor
    else
      render :action => 'new'
    end
  end

  def edit
    @autor = Autor.find(params[:id])
  end

  def update
    cache_loeschen
    @autor = Autor.find(params[:id])
    if @autor.update_attributes(params[:autor])
      flash[:notice] = 'Autor was successfully updated.'
      redirect_to :action => 'show', :id => @autor
    else
      render :action => 'edit'
    end
  end

  def destroy
    Autor.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
