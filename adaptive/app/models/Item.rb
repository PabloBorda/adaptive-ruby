class Item < ActiveRecord::Base
      belongs_to :user 
      belongs_to :category 
      default_scope -> { order('created_at DESC') }

      def recipients
       [
         { email: '<biz email address>', amount: '1.00', primary: false },
         { email: 'item.user.booth.paypal_email', amount: '5.00', primary: true }
       ]
      end
    end