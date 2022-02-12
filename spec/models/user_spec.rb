require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User validation tests' do
    subject { User.new(name: 'Willy', email: 'willy@mail.com', password: 'asdzxc', confirmed_at: Time.now) }
    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'email should be present' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'password should be present' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end
end
