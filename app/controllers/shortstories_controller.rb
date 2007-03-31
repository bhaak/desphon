
class ShortstoriesController < ApplicationController
helper :sort
include SortHelper

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
	  sort_init 'id'
		sort_update
		# @items = Contact.find(:all, :order => sort_clause)
    @shortstory_pages, @shortstories = paginate :shortstories, :per_page => 10, :order => sort_clause
  end

  def show
    @shortstory = Shortstory.find(params[:id])
  end

  def new
    @shortstory = Shortstory.new
  end

  def create
    @shortstory = Shortstory.new(params[:shortstory])
    if @shortstory.save
      flash[:notice] = 'Shortstory was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @shortstory = Shortstory.find(params[:id])
  end

  def update
    @shortstory = Shortstory.find(params[:id])
    if @shortstory.update_attributes(params[:shortstory])
      flash[:notice] = 'Shortstory was successfully updated.'
      redirect_to :action => 'show', :id => @shortstory
    else
      render :action => 'edit'
    end
  end

  def destroy
    Shortstory.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
