require 'rails_helper'

RSpec.describe 'Group', type: :request do
  subject do
    Group.new(
      name: 'Gym'
    )
  end
  before { subject.save }
  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
