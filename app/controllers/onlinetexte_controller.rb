class OnlinetexteController < ApplicationController
  layout 'application'

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update, :update_authors ],
         :redirect_to => { :action => :list }

  before_filter :redirect_to_homepage, :except => [:list, :show]

  def list
    if params[:format].blank?
      @seiten_titel = "Texte"
      @onlinetext_pages, @onlinetexte = paginate :onlinetexte, :per_page => 10, :order => 'titel', :include => :autoren
    else
      @seiten_titel = "Texte im Format "+params[:format]
      @onlinetext_pages, @onlinetexte = paginate :onlinetexte, :per_page => 10, :order => 'titel',
        :include => [:onlinetextelinks, :autoren], :conditions => ["onlinetextelinks.mime_typ = ?", params[:format]]
    end
  end

  def veroeffentlicht
    @onlinetext_pages, @onlinetexte = paginate :onlinetexte, :per_page => 10, :order => 'jahr,titel', :include => :autoren
  end

  def show
    @onlinetext = Onlinetext.find(params[:id])
    minTime = Time.rfc2822(request.env["HTTP_IF_MODIFIED_SINCE"]) rescue nil
    if minTime and @onlinetext.updated_at <= minTime 
      render :nothing => true, :status => 304
    else
      response.headers['Last-Modified'] = @onlinetext.updated_at.httpdate if in_production?
    end
  end

  def new
    @onlinetext = Onlinetext.new
  end

  def create
    @onlinetext = Onlinetext.new(params[:onlinetext])
    if @onlinetext.save
      flash[:notice] = 'Onlinetext was successfully created.'
      redirect_to :action => 'show', :id => @onlinetext.id
    else
      render :action => 'new'
    end
  end

  def edit
    @onlinetext = Onlinetext.find(params[:id])
  end

  def update
    @onlinetext = Onlinetext.find(params[:id])
    if @onlinetext.update_attributes(params[:onlinetext])
      flash[:notice] = 'Onlinetext was successfully updated.'
      redirect_to :action => 'show', :id => @onlinetext
    else
      render :action => 'edit'
    end
  end

  def destroy
    Onlinetext.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def add_author
    @onlinetext = Onlinetext.find(params[:id])
  end

  def update_authors
    @onlinetext = Onlinetext.find(params[:id])
    puts params[:selektierte_autoren]
    @onlinetext.autoren = []
    for autor in params[:selektierte_autoren] do
      @onlinetext.autoren << Autor.find(autor)
    end
    flash[:notice] = 'Autoren wurden aktualisiert.'
    flash[:warning] = 'Warnung.'
    flash[:error] = 'Autoren.'
    flash[:alert] = 'Autoren.'
    redirect_to :action => 'show', :id => params[:id]
  end
end
