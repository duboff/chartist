require 'spec_helper'

describe User do

  let(:user) { create(:user) }


  context 'Validations' do
    it 'email is present' do
      user.email = nil
      expect(user).not_to be_valid
    end
  end
end
