class UsersController < ApplicationController
  def products
    render :json => { data: { products: [{ name: 'product1', quantity: 1 },
                                        { name: 'product2', quantity: 2 },
                                        { name: 'product3', quantity: 3 }]
                            }
                    }
  end
end
