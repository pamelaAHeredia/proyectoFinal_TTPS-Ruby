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
  has_many :schedules
  has_many :appointments, dependent: :restrict_with_exception
  has_many :users 

end
