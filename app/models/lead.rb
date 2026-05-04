class Lead < ApplicationRecord

  # Presence validations
  validates :vehicle_reg, :mobile, :insurer, presence: true

  # Mobile: 10-digit Indian number
  validates :mobile,
            format: {
              with: /\A[6-9]\d{9}\z/,
              message: "must be a valid 10-digit Indian mobile number"
            }

  # Vehicle Registration Number (basic Indian format)
  validates :vehicle_reg,
            format: {
              with: /\A[A-Z]{2}\d{1,2}[A-Z]{2,3}\d{4}\z/i,
              message: "must be valid (e.g., DL2DCA1234)"
            }

  # Optional: Normalize data before validation
  before_validation :normalize_fields

  private

  def normalize_fields
    self.vehicle_reg = vehicle_reg.to_s.upcase.strip
    self.mobile = mobile.to_s.strip
  end

end