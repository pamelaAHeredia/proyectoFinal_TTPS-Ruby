class User < ApplicationRecord
  rolify before_add: :before_add_method
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true,
                       length: { in: 3..20 },
                       format: {
                         with: /\A[a-z0-9A-Z]+\z/,
                         message: :invalid
                       }
  validates :password, length: { minimum: 6 }

  def assign_role(role)
    if role.blank?
      add_role :client
    else
      add_role role
    end
  end

  def update_role(role)
    add_role role
  end

  private

  def before_add_method(_role)
    self.roles = []
  end
end
