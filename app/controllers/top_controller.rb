class TopController < ApplicationController
    
    # DB= Product (name:string = mid),(price:integer=price)
    #         |    
    #         -----------
    #                   |
    #DB=CartItem(product_id:integer ==prid  )     (cart_id:integer==cart_id)     量 (quantity:integer=qu)
      #                                              |
    #DB=Cart-----------------------------------------
    def main
        @Product=Product.all
        @CartItem=CartItem.all
        logger.debug( "main")
        logger.debug(session[:cart_id])
        logger.debug("@CartItem.all")
        logger.debug(@CartItem.all)
      
        #mainページ(products#main)
        render "index"
    end
    
    def index
    #商品一覧ページ(products#index)
    logger.debug("index")

    end
    
    def show
    #カートページ(carts#show)
    logger.debug("show")
    @Product=Product.all
    @CartItem=CartItem.all
    @Cart=Cart.all
   
    end
    def new
    #カートアイテムページ(cartitems#new)
        if params[:mid]!=nil 
         
        
            logger.debug("new")
             @Product = Product.new(name: params[:mid],price: params[:price])
              if @Product.save
                  logger.debug("save")
                  flash[:notice] = '1レコード追加しました'
                    @Product=Product.all
                    redirect_to"/"
              else
                  logger.debug("notsave")
                  logger.debug(@CartItem.errors.full_messages)
                render 'new'
                
              end
              
              else
                  logger.debug("nill")
                     render"new"
        end
    end
    def add
        #indexにおいてCartItemに対して  new(product_id:integer   cart_id:integer   quantity:integer)
        cart = current_cart
        @Product=Product.all
         quantity = params[:qu].to_i
         p_c_id = CartItem.find_by(prid: params[:id], cart_id: cart.id)

        if p_c_id
            p_c_id.qu += 1
            if p_c_id.save
                logger.debug("p__cid__win")
                flash[:notice] = '1レコードCart_item変更しました'
            else
                logger.debug("p_cid__out")
                flash[:notice] = '1レコードのCart_item変更に失敗しました'
            end
            
        else
            @CartItem = CartItem.new(prid: params[:id],cart_id: cart.id,qu:  params[:qu])
            if @CartItem.save
                logger.debug("save_app")
                flash[:notice] = '1レコードCart_item追加しました'
                   
            else
            logger.debug("notsave_app")
            　　flash[:notice] = '1レコードCart_item追加に失敗しました'
            end
        end
        @Product=Product.all
                        redirect_to"/"
    end
    def destroy
      tweet = Tweet.find(params[:id])
      tweet.destroy
      flash[:notice] = '1レコード削除しました'
      redirect_to '/'
    end
    def delete_product_path
        record = Record.find(id)
        record.destroy
    end
end