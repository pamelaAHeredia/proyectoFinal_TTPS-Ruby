module UsersHelper
  def get_roles
    { 'Administrador' => :admin,
      'Cliente' => :client,
      'Personal Bancario' => :bank_stuff,
      'Uno de Prueba' => :prueba }
  end
end
