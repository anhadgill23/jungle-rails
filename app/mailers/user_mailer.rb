class UserMailer < ApplicationMailer
    default from: 'no-reply@jungle.com'

    def order_receipt(order)
        @order = order
        @url  = '/orders/:id'
        mail(to: order.email, subject: "Order ID: #{order.id}. Thank you for your order!")
    end
end
