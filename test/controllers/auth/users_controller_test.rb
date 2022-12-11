class Auth::UsersControllerTest < ActionDispatch::IntegrationTest
    test "should get new" do 
        get new_user_url
        assert_response :success
    end

    test "should create user" do 
        assert_difference("user.count") do 
            post users_url, params: {user: , { email: 'usuario@mail.com'}}
    end
end