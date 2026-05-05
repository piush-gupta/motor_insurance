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
        ncb: params[:ncb],
        claims: params[:claims],
        previous_policy_expiry_date: params[:previous_policy_expiry_date],
        idv_preference: params[:idv_preference]
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
    
    base = rand(3000..8000)

    # adjust based on IDV preference
    idv = params[:idv_preference]

    case idv
    when "high"
      base += 1000
    when "low"
      base -= 500
    end

    @quotes = build_quotes(base).sort_by { |q| q[:amount] }
  end

  private

  def get_company_name
    ('A'..'Z').to_a.sample(4).join + " Insurance Corp"
  end

  def build_quotes(base_amount)
    [
      {
        insurance_provider: get_company_name,
        amount: base_amount + rand(100..500)
      },
      {
        insurance_provider: get_company_name,
        amount: base_amount - rand(50..300)
      },
      {
        insurance_provider: get_company_name,
        amount: base_amount + rand(0..200)
      },
      {
        insurance_provider: get_company_name,
        amount: base_amount - rand(100..200)
      }
    ]
  end

end