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
    @list.list_items.build
    # @list.list_hash = rand(9999)
    # @list.list_hash = Digest::MD5.hexdigest({Time.now.to_s, rand}.to_s)[1..5]
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
    
    @done_tasks = params[:done]
    @done_tasks.each do |task|
      
    end
    
    
    # "done"=>{"0"=>{"title"=>"Helo", "id"=>"7"}, "1"=>{"title"=>"done task", "id"=>"4"}}
    #    
    #    "list"=>{"name"=>"asd", "list_items_attributes"=>{"0"=>{"title"=>"Helo", "id"=>"7", "_destroy"=>"0", "status"=>""}}}
    
    @list = List.find_by_list_hash(params[:id])
    
    respond_to do |format|
      if @list.update_attributes(params[:list])
        #format.html { redirect_to list_path(@list.list_hash) }
        #format.xml { head :ok }
        format.json { @list.to_json }
      end
    end
  end
  
end
