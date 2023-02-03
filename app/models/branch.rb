class Branch < ApplicationRecord

  validates :name, presence: true, uniqueness: true, length: { in: 3..30 },
                   format: {
                     with: /\A[a-z0-9A-Zñáéíóú\s]+\z/,
                     message: :invalid
                   }
  validates :address, presence: true,
                      format: {
                        with: /\A[a-z0-9A-Zñáéíóú\s]+\z/,
                        message: :invalid
                      }
  validates :telephone, presence: true, length: { minimum: 10 },
                        format: {
                          with: /\A\(?\d{3}\)?[\s|-]?\d{3}-?\d{4}\z/,
                          message: :invalid
                        }

  belongs_to :locality
  has_many :schedules, dependent: :destroy
  has_many :appointments
  has_many :users


  def pending_appointments?
    appointments.any? { |e| e.pending? }
  end

end
