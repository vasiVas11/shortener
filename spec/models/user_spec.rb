require 'spec_helper'

describe User do

  it "can be instantiated" do
    User.new.should be_an_instance_of(User)
  end

  it "can create user" do
    user = User.new(:email => "test_create_2@mailinator.com", :password => "blabla12")
    expect { user.save }.to change(User, :count)
  end

  it "should not create user without email" do

    user = User.new(:password => "blabla")
    expect { user.save }.should_not change(User, :count)

  end

  it "should not create user with short password" do

    user = User.new(:email => "test_create_23@mailinator.com", :password => "a12")
    expect { user.save }.should_not change(User, :count)

  end

  it "should not create user with if email already exist" do

    user = User.new(:email => "test_create_2@mailinator.com", :password => "blabla12")
    user2 = User.new(:email => "test_create_2@mailinator.com", :password => "blabla12")
    user.save
    expect { user2.save }.should_not change(User, :count)

  end

end
