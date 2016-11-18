module PagesHelper
  def balance_status(user)
    Purchase.balance(user) > 10_000 ? 'label-danger' : 'label-success'
  end  
end
