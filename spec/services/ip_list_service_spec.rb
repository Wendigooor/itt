require 'spec_helper'

describe IpListService do
  subject { IpListService.new() }

  before(:all) do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    FactoryGirl.create(:post, { user: user1, title: '1', ip: '1.1.1.1' })
    FactoryGirl.create(:post, { user: user1, title: '2', ip: '13.13.13.13' })
    FactoryGirl.create(:post, { user: user2, title: '3', ip: '1.1.1.1' })
    FactoryGirl.create(:post, { user: user2, title: '4', ip: '12.12.12.12' })
  end

  describe '.perform' do
    before do
      subject.perform
    end

    it 'return one result' do
      expect(subject.results).not_to be_empty
    end
  end
end
