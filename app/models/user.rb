class User < ApplicationRecord
  rolify
    # para que la contraseña funcione encriptada, se usa bcrypt
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
      if (role.blank?)
        self.add_role(:client) 
      else
        self.add_role(role)
      end
    end

    def update_role(role)
      if self.roles.length > 0
        self.remove_role self.roles.pluck(:name)
        self.add_role(role)
      end
    end 

    private 
end
