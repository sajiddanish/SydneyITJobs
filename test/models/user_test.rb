require 'test_helper'

class UserTest < ActiveSupport::TestCase
    
    def setup
        @user = User.new(username: "John", email: "johnwhite@hotmail.com", experstise: "Software Analyst", experience: "5 Years",
        skills: "Java, C++, Web Development, salesforce", location: "Australia")
    end
    
    test "user should be valid" do
        assert @user.valid?
    end
    
    test "username should be valid" do
        @user.username = " "
        assert_not @user.valid?
    end
    
    test "username should not be too long" do
        @user.username = "a" * 41
        assert_not @user.valid?
    end
    
    test "username should not be too short" do
        @user.username = "a"
        assert_not @user.valid?
    end
    
    test "email should be present" do
        @user.email = " "
        assert_not @user.valid?
    end
    
    test "email length should be within bounds" do
        @user.email = "a" * 100 + "example.com"
        assert_not @user.valid?
    end
    
    test "email address should be unique" do
        dup_user = @user.dup
        dup_user.email = @user.email.upcase
        @user.save
        assert_not dup_user.valid?
    end
    
    test "email validation should accept valid addresses" do
        valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eee.au laura+jeo@monk.cm]
        valid_addresses.each do |va|
        @user.email = va
        assert @user.valid?, '#{va.inspect} should be valid'
    end
    end
    
    test "email validation should reject invalid addresses" do
        invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee_@i_am_.com foo@eee+aar.com]
        invalid_addresses.each do |ia|
        @user.email = ia
        assert_not @user.valid?, '#{ia.inspect} should be valid'
    end
    end
    
    test "experstise should be valid" do
        @user.experstise = " "
        assert_not @user.valid?
    end
    
    test "experstise should not be too long" do
        @user.experstise = "a" * 101
        assert_not @user.valid?
    end
    
    test "experstise should not be too short" do
        @user.experstise = "a" * 9
        assert_not @user.valid?
    end
    
    test "experience should be valid" do
        @user.experience = " "
        assert_not @user.valid?
    end
    
    test "experience should not be too long" do
        @user.experience = "a" * 101
        assert_not @user.valid?
    end
    
    test "experience should not be too short" do
        @user.experience = "a" * 3
        assert_not @user.valid?
    end
    
     test "skills should be valid" do
        @user.skills = " "
        assert_not @user.valid?
    end
    
    test "skills should not be too long" do
        @user.skills = "a" * 501
        assert_not @user.valid?
    end
    
    test "skills should not be too short" do
        @user.skills = "a" * 9
        assert_not @user.valid?
    end
    
    test "location should be valid" do
        @user.location = " "
        assert_not @user.valid?
    end
    
    test "location should not be too long" do
        @user.location = "a" * 26
        assert_not @user.valid?
    end
    
    test "location should not be too short" do
        @user.location = "a" 
        assert_not @user.valid?
    end
    
end
