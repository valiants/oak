require 'test_helper'

class MicropubTest < ActionDispatch::IntegrationTest

  include Oak::Engine.routes.url_helpers

  setup do
    @routes = Oak::Engine.routes
    
    @user = User.find_or_create_by email: "test@example.com"
    
    @token  = Oak::IndieauthAuthorizationRequest.find_or_create_by access_token: "TESTTOKEN", approved: true, user_id: @user.id
    
  end

  test "Discovering the Micropub endpoint given the profile URL of a user" do
    skip( "Pending" )
  end

  test "Authenticating requests by including the access token in the HTTP Authorization header" do
    skip( "Pending" )
  end

  test "Authenticating requests by including the access token in the post body for x-www-form-urlencodedrequests" do
    skip( "Pending" )
  end
  
  test "Limiting the ability to create posts given an access token by requiring that the access token contain at least one OAuth 2.0 scope value" do
    skip( "Pending" )
  end
  
  test "Creating a post using x-www-form-urlencoded syntax with one or more properties" do
    post micropub_post_path, params: "h=entry&content=Micropub+test+of+creating+a+basic+h-entry", headers: { "Authorization" => "Bearer #{@token.access_token}"}
    
    assert_equal 201, status    
  end


end
