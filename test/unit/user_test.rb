require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user should enter a first name" do 
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty? 
    #asserting that the errors on the first_name field are not empty.
  end

  test "user should enter a last name" do 
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end

  test "user should enter a profile name" do 
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "user should have a unique profile name" do 
    user = User.new
    user.first_name = "Colin"
    user.last_name = "Stodd"
    user.email = "user@example.com"
    user.profile_name = "cbstodd"
    user.password = "foobar"
    user.password_confirmation = "foobar"
    assert !user.save
    puts user.errors.inspect 
    assert !user.errors[:profile_name].empty?
  end

  test "user should have a profile name without spaces" do 
    user = User.new
        # creates a user.
    user.profile_name = "Profile name with spaces."
        # creates a new user instance with the profile_name with spaces.
    assert !user.save 
        # makes sure that the incorrect profile name w/spaces cannot be saved. 
    assert !user.errors[:profile_name].empty?
        # makes sure that there ARE some errors in the profile name.
  end

  test "a user can have a correctly formatted profile name" do 
    user = User.new(first_name: 'Colin', 
                    last_name: 'Stodd', 
                    email: 'user@example.com')
    user.password = user.password_confirmation = 'password'
    user.profile_name = 'cbstodd'
  end

end
