module UsersHelper
  
  def get_roles
    { 'Administrador' => :admin,
      'Cliente' => :customer,
      'Personal Bancario' => :bank_staff }
  end

end
