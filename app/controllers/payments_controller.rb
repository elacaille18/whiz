class PaymentsController < ApplicationController
  def create
    @mission = current_user.missions.where(status: "pending_payment").find(params[:mission_id])
    authorize @mission

    @amount_cents       = @mission.price_cents
    stripe_customer_id  = current_user.stripe_customer_id

    unless stripe_customer_id
      stripe_customer = Stripe::Customer.create(
        source: params[:stripeToken],
        email:  params[:stripeEmail]
      )
      stripe_customer_id = stripe_customer.id
      current_user.update(stripe_customer_id: stripe_customer_id)
    end

    charge = Stripe::Charge.create(
      customer:     stripe_customer_id,
      amount:       @amount_cents,
      description:  "Paiement pour mission #{@mission.id}",
      currency:     'eur'
    )

    # SmsSender.new.send_message("+33644607591", @mission.receiver_phone.gsub(/[ .-]/, ""), "Le code à transmettre au transporteur est le : \n #{@mission.end_code} \n L'équipe Whiz")

    @mission.update(payment: charge.to_json, status: 'ready')

    redirect_to mission_path(@mission)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to mission_path(@mission)
  end
end
