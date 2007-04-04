class OnlinetexteController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @onlinetext_pages, @onlinetexte = paginate :onlinetexte, :per_page => 10
  end

  def show
    @onlinetext = Onlinetext.find(params[:id])
  end

  def new
    @onlinetext = Onlinetext.new
  end

  def create
    @onlinetext = Onlinetext.new(params[:onlinetext])
    if @onlinetext.save
      flash[:notice] = 'Onlinetext was successfully created.'
      redirect_to :action => 'list'
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
end
