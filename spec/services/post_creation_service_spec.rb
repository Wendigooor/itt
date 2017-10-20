require 'rails_helper'

RSpec.describe PostCreationService do
  let(:valid_params) do
    {
      title: 'Test',
      body: 'Body',
      login: 'Login',
      ip: '1.1.1.1'
    }
  end

  let(:invalid_params) do
    {}
  end

  describe '.perform' do
    context 'with invalid params' do
      subject { PostCreationService.new(invalid_params) }

      context 'does not create new post and user' do
        it { expect { subject.perform }.to_not change { Post.count } }
        it { expect { subject.perform }.to_not change { User.count } }
      end

      it 'will return false' do
        result = subject.perform
        expect(result).to eq false
      end

      it 'will have errors' do
        result = subject.perform
        expect(subject.errors).to_not be_nil
      end
    end

    context 'with valid params' do
      subject { PostCreationService.new(valid_params) }

      context 'with exist user will create only new post' do
        let!(:user) { FactoryGirl.create(:user, { login: 'Login' }) }

        let(:params) do
          valid_params.tap do |params|
            params[:login] = user.login
          end
        end

        it { expect { subject.perform }.to change { Post.count } }
        it { expect { subject.perform }.to_not change { User.count } }
      end

      context 'without exist user' do
        let(:params) { valid_params }

        it { expect { subject.perform }.to change { Post.count }.by(1) }
        it { expect { subject.perform }.to change { User.count }.by(1) }
      end

      it 'will return true' do
        result = subject.perform
        expect(result).to eq true
      end
    end
  end

end
