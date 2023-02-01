module UsersHelper
  def get_roles
    { 'Administrador' => :admin,
      'Cliente' => :client,
      'Personal Bancario' => :bank_staff }
  end
end
