class List < ActiveRecord::Base  
  has_many :list_items, :order => 'created_at DESC'
  
  accepts_nested_attributes_for :list_items, :allow_destroy => true
end
