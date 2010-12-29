class ListsController < ApplicationController
  
  def show
    @list = List.find_by_list_hash(params[:id])
    respond_to do |format|
      format.html # index.html
      format.xml { head :ok }
      format.json { @list.to_json }
    end
  end
  
  def new
    
    @list = List.new
    @list.list_hash = ActiveSupport::SecureRandom.hex(3)
    respond_to do |format|
      if @list.save
        format.html { redirect_to list_path(@list.list_hash) }
        format.xml { head :ok }
        format.json { @list.to_json }
      end
    end
  end
  
  def update
    @list = List.find_by_list_hash(params[:list_id])
    
    
    case params[:mode]
      when "add"
        @item = ListItem.new
        @item.hash_item = params[:id].split(":")[1]
        @item.status = "active"
        @item.title = params[:title]
        @item.list_id = @list.id
        @item.save
      when "delete"
        @item = @list.list_items.find_by_hash_item(params[:id].split(":")[1])
        @item.destroy
      when "done"
        @item = @list.list_items.find_by_hash_item(params[:id].split(":")[1])
        @item.status = "done"
        @item.save
      when "active"
        @item = @list.list_items.find_by_hash_item(params[:id].split(":")[1])
        @item.status = "active"
        @item.save
      else
      
    end
    
    render :text => "var ok = 'ok';"
  end
  
end
