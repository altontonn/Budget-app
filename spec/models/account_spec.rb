require 'rails_helper'

RSpec.describe 'Account', type: :request do
   subject do
      Account.new(
         name: 'Gym',
         amount: 44
      )
   end
   before { subject.save }
   it 'Name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
   end
   it 'Amount should be an integer' do
      subject.amount = 'ten'
      expect(subject).to_not be_valid
   end
end
