require 'rubygems'
require 'active_merchant'


class ItemsController < ApplicationController
      include ActiveMerchant::Billing::Integrations
        before_action :logged_in_user, only: [:edit, :update, :new, :destroy]
      before_action :correct_user, only: [:edit, :update, :destroy]

        def show
            @item = Item.find(params[:id])
        end


      def gateway
        @gateway ||= ActiveMerchant::Billing::PaypalAdaptivePayment.new \
        login: 'us-30_api1.cri.com',
        password: 'EYFNSNUSV85CT34Z',
        signature: 'AH57zE.nAaElaFFAysViNA9TIte1AxtSpBjx2HLqHJOiu2js3l1Kd48i',
        appid: ''

        response = gateway.setup_purchase \
        return_url: root_url,
        cancel_url: item_path,
        #ipn_notification_url: <notification URL>,
        receiver_list: recipients

        redirect_to gateway.redirect_url_for(response['payKey'])
      end
end 