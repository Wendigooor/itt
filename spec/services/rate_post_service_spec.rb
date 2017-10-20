require 'rails_helper'

RSpec.describe RatePostService do
  describe '.perform' do
    let(:post) { FactoryGirl.create(:post) }
    subject { RatePostService.new(post, mark) }

    context 'new rating' do
      let(:mark) { 10 }
      let(:new_average_ratio) { (2 + 10) / 2.0 }

      before do
        FactoryGirl.create(:rating, { post: post, mark: 2 })

        subject.perform
      end

      it { expect(subject.average_ratio).to eq(new_average_ratio) }
    end

    context 'create rating' do
      let(:mark) { 10 }

      it { expect { subject.perform }.to change { Rating.count }.by(1) }
    end

    context 'less than 0' do
      let(:mark) { -10 }

      it { expect { subject.perform }.to_not change { Rating.count } }
    end
  end
end
