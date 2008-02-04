class OnlinetextelinksController < ApplicationController

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  before_filter :redirect_to_homepage

  def new
    @onlinetextelink = Onlinetextelink.new
    if params[:onlinetext] != nil then
			@onlinetextelink.onlinetext_id = params[:onlinetext]
		end

  end

  def create
    cache_loeschen
    @onlinetextelink = Onlinetextelink.new(params[:onlinetextelink])
    if @onlinetextelink.save
      flash[:notice] = 'Onlinetextelink was successfully created.'
      redirect_zum_onlinetext
    else
      render :action => 'new'
    end
  end

  def edit
    @onlinetextelink = Onlinetextelink.find(params[:id])
  end

  def update
    cache_loeschen
    @onlinetextelink = Onlinetextelink.find(params[:id])
    if @onlinetextelink.update_attributes(params[:onlinetextelink])
      flash[:notice] = 'Onlinetextelink was successfully updated.'
      redirect_zum_onlinetext
    else
      render :action => 'edit'
    end
  end

  def destroy
    cache_loeschen
    @onlinetextelink = Onlinetextelink.find(params[:id])
    onlinetextelink.destroy
    redirect_zum_onlinetext
  end

  def redirect_zum_onlinetext
    redirect_to :action => 'show', :controller => "onlinetexte", :id => @onlinetextelink.onlinetext_id
  end
end
