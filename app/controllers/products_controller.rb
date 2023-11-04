class ProductsController < ActionController::Base
        def show
    #カートページ(carts#show)
    logger.debug("show__P")
    @Cart=Cart.all
    @Product=Product.all
    @CartItem=CartItem.all
    product = Product.find(params[:id])
    product.destroy
    logger.debug("destroy")
    redirect_to '/'
    end
end