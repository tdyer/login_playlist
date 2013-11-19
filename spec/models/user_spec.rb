require 'spec_helper'

describe User do
  subject do
    User.create(email: 'foo@example.com', password: 'foo')
  end

  it { should have_many(:playlists) }
  # it { should have_many(:songs).through(:playlists) }

  it "should have validations" do
    # subject.should validate_presence_of(:password)
    subject.should validate_presence_of(:email)
    #subject.should validate_confirmation_of(:password)
     subject.should validate_uniqueness_of(:email)
  end

end
