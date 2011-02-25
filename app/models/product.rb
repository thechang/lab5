class Product < ActiveRecord::Base
    validates_presence_of :title, :description, :price, :image_url
    validates_numericality_of :price, :greater_than => 0.01
    validates_numericality_of :projection, :greater_than => 0
    validates_uniqueness_of :title
    validates_format_of :image_url, :with => %r{\.(gif|jpg|png)$}i, :message => "Only letters allowed"
    
    def before_create
	id = product.id
	product_id = product.product_id
	previous_balance = 0 
	new_balance = product.amount 
	future_balance = product.amount + product.projection 
    end
    def before_modifying
	previous_balance = product.new_balance 
	new_balance = product.amount 
	future_balance = product.amount + product.projection
    end
    def before_delete
	delete from inventory where inventory.id=product.id
    end
    
end
