require 'test_helper'

class Api::V1::MembersControllerTest < ActionDispatch::IntegrationTest
  # --- Characterization: what the API does today -------------------------

  test "POST /members with flat params fails: password is dropped (current behavior)" do
    assert_no_difference "Member.count" do
      post "/api/v1/members", params: {
        name: "brendo", email: "brendo@brendo.com", admin_level: 1, password: "password"
      }, as: :json
    end

    assert_response :ok
    assert_includes json["errors"], "Password can't be blank"
  end

  test "GET /members lists every member in JSON:API shape" do
    get "/api/v1/members"

    assert_response :ok
    assert_equal 2, json["data"].length

    wayne = json["data"].find { |m| m["id"] == members(:wayne).id.to_s }
    assert_equal "member", wayne["type"]
    assert_equal %w[admin_level created_at email name personas], wayne["attributes"].keys.sort
    assert_equal "wayne@wayne.com", wayne["attributes"]["email"]
  end

  test "POST /members with nested params creates a member" do
    assert_difference "Member.count", 1 do
      post "/api/v1/members", params: {
        member: { name: "brendo", email: "brendo@brendo.com", admin_level: 1, password: "password" }
      }, as: :json
    end

    assert_response :accepted
    assert_equal "brendo", json["data"]["attributes"]["name"]
  end

  test "POST /members with a duplicate email returns 200 with errors (current behavior)" do
    assert_no_difference "Member.count" do
      post "/api/v1/members", params: {
        member: { name: "copycat", email: "wayne@wayne.com", password: "password" }
      }, as: :json
    end

    assert_response :ok
    assert_includes json["errors"], "Email has already been taken"
  end

  # --- Known bugs: the correct behavior, skipped until fixed --------------

  test "POST /members with a duplicate email returns 422" do
    skip "known bug: failed creates return 200 instead of 422"
    post "/api/v1/members", params: {
      member: { name: "copycat", email: "wayne@wayne.com", password: "password" }
    }, as: :json

    assert_response :unprocessable_entity
  end
  
  test "POST /members with flat params creates a member" do
    skip "known bug: wrap_parameters drops password (not a column), so flat JSON can't create members"
    assert_difference "Member.count", 1 do
      post "/api/v1/members", params: {
        name: "brendo", email: "brendo@brendo.com", admin_level: 1, password: "password"
      }, as: :json
    end

    assert_response :accepted
  end
end