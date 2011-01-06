xml.instruct!
xml.root do
  xml.item do
    xml.value @list.list_items.where(:status => "active").count
    xml.text "Still on the tap"
  end
  xml.item do
    xml.value
    xml.text
  end
  xml.item do
    xml.value @list.list_items.where(:status => "done").count
    xml.text "Completed tasks"
  end
end