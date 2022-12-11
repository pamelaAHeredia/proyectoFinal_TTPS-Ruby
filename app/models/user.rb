class User < ApplicationRecord
  rolify
    # para que la contraseña funcione encriptada, se usa bcrypt
    has_secure_password 
    after_create :assign_default_role

    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true, 
    length: { in: 3..20 }, 
    format: {
        with: /\A[a-z0-9A-Z]+\z/,
        message: :invalid
    }
    validates :password, length: { minimum: 6 }

    before_save :downcase_attributes

    private 

    def downcase_attributes
        self.username = username.downcase
        self.email = email.downcase
    end

    def assign_default_role
      self.add_role(:client) if self.roles.blank?
    end
end
