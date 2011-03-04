class Product < ActiveRecord::Base
    validates_presence_of :title, :description, :price, :image_url
    validates_numericality_of :price, :greater_than => 0.01
    validates_numericality_of :projection, :greater_than => 0
    validates_uniqueness_of :title
    validates_format_of :image_url, :with => %r{\.(gif|jpg|png)$}i, :message => "Only letters allowed"
       
    protected
    
    def before_create
    invent = Inventory.new
    invent.previous_balance = 0
    invent.new_balance = amount
    invent.future_balance = amount + projection
    invent.save
    end

    def before_modifying
    viejo = Inventories.find_by_product_id(id).last
    nuevo = Inventory.new
    nuevo.previous_balance = viejo.new_balance
    nuevo.new_balance = viejo.amount
    nuevo.future_balance = viejo.amount + viejo.projection
    nuevo.save
    end

    def before_delete
	registro = Inventories.find_by_product_id(id)
	registro.each do |regi|
	    regi.delete
    end
    end
    
end