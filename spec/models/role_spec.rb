require 'rails_helper'

RSpec.describe Role, type: :model do
  before(:each) do
    @a_user = FactoryGirl.build(:user)
    @another_user = FactoryGirl.build(:user, :email => 'test2@test.com', :password => 'agoodpassword')
  end

  after(:each) do
    @a_user.roles.each do |role|
      @a_user.remove_role role
   end
    @another_user.roles.each do |role|
      @another_user.remove_role role
    end
    Map.find_roles.each do |role|
      Role.delete(role.id)
    end
  end

  it "should allow a user to have many different roles" do
    expect(@a_user.roles.size).to eq(0)
    @a_user.add_role(:admin)
    @a_user.add_role(:loser)
    expect(@a_user.has_role?(:admin)).to eq(true)
    expect(@a_user.has_role?(:loser)).to eq(true)
    expect(@a_user.roles.size).to eq(2)
  end

end

