class LeadsController < ApplicationController

  def step1
  end

  def step1_submit
    session[:lead] = {
      mobile: params[:mobile],
      vehicle_reg: params[:vehicle_reg]
    }

    # Fake vehicle lookup
    session[:lead][:city] = params[:vehicle_reg][0..1]

    redirect_to "/step2"
  end

  def step2
  end

  def step2_submit
    lead_data = session[:lead].merge(
        insurer: params[:insurer],
        ncb: params[:ncb],
        claims: params[:claims]
    )

    @lead = Lead.new(lead_data)

    if @lead.save
        redirect_to "/quote"
    else
        flash[:errors] = @lead.errors.full_messages
        redirect_to "/step2"
    end
  end

  def quote
    @quote = {insurance_provider: get_company_name, amount: rand(3000..8000), }
  end

  private

  def get_company_name
    ('A'..'Z').to_a.sample(4).join + " Insurance Corp"
  end

  def calculate_fraud(params)
    score = 0

    score += 1 if params[:hidden_field].present? # honeypot
    score += 1 if params[:mobile].to_s.length != 10

    score
  end
end