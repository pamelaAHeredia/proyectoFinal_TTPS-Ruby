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

  has_many :appointments, dependent: :destroy
  belongs_to :branch, optional: true

  def new_bank_staff?
    :roles == 'Personal Bancario'
  end

  def assign_role(role)
    if role.blank?
      add_role :customer
    else
      add_role role
    end
  end

  def owner?
    id == Current.user.id
  end

  def customer?
    has_role? :customer
  end

  def admin?
    has_role? :admin
  end

  def bank_staff?
    has_role? :bank_staff
  end

  def get_role
    if admin?
      :admin
    elsif bank_staff?
      :bank_staff
    else
      :customer
    end
  end
  def branch_name
    Branch.find_by_id(branch_id).name
  end

  private

  def before_add_method(_role)
    self.roles = []
  end
end
