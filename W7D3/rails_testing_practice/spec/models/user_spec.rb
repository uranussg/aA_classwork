require 'rails_helper'


RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:goals) }
  it { should have_many(:comments) }
  it { should have_many(:comments_received) }
  it { should have_many(:goals_commented_on) }

  subject(:harry) { User.create(username: 'hp', password: "harry123" ) }
  it {should validate_uniqueness_of(:username)}

  describe "ensure_session_token" do 
    it "assigns a session token if not exist" do
      expect(FactoryBot.build(:user).session_token).not_to be_nil
    end
  end

  describe "sets and checks credentials" do
    it "set up password hashed through Bcrypt" do  
      expect(BCrypt::Password).to receive(:create).with("password123")
      FactoryBot.build(:user, password: "password123")
    end

    it "store the hashed password into password_digest" do   
      user = FactoryBot.build(:user, password: "password123")
      expect(user.password_digest).not_to be_nil
    end

    it "identify a user by username and password combo" do 
      u1 = FactoryBot.create(:user, username: "hp", password: "harry123")
      expect(User.find_by_credentials("hp", "harry123").id).to eq(u1.id)
    end  

    it "checked if an entered password is correct" do 
      expect(harry.is_password?("harry123")).to be true
    end

    it "should not save password to database" do 
      u1 = FactoryBot.create(:user, username: "hp", password: "harry123") 
      expect(User.find_by(username: "hp").password).to be_nil 
    end

  end
end
