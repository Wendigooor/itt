require 'rails_helper'

describe Api::V1::PostsController, type: :controller do
  describe 'POST #create' do
    let(:post_params) do
      {
        title: 'Title',
        body: 'Body',
        login: 'Login',
        ip: '1.1.1.1'
      }
    end
    subject { post :create, { params: post_params, format: :json } }

    context 'when invalid data' do
      before { post_params[:title] = nil }

      it { expect(subject.content_type).to eq 'application/json' }
      it { expect(subject.status).to eq 422 }

      it { expect(subject.body).to include("errors") }
      it 'responds with errors' do
        expect(JSON.parse(subject.body)['errors']).to eq(['Title can\'t be blank'])
      end
    end

    context 'with valid data' do
      it { expect(subject.content_type).to eq 'application/json' }
      it { expect(subject.status).to eq 200 }

      it 'create new post' do
        expect { subject }.to change { Post.count }
      end

      it { expect(subject.body).to_not include("errors") }
      it { expect(subject.body).to include("title", "body", "ip") }
    end
  end

  describe 'GET #top' do
    before { FactoryGirl.create(:post, average_ratio: 5.0 ) }
    before { FactoryGirl.create(:post, average_ratio: 4.0 ) }
    before { FactoryGirl.create(:post, average_ratio: 3.0 ) }
    subject { get :top_rated, { params: { limit: 5 }, format: :json } }

    it { expect(subject.content_type).to eq 'application/json' }
    it { expect(subject.status).to eq 200 }

    it { expect(JSON.parse(subject.body).count).to eq(3) }
    it 'with correct first result' do
      expect(JSON.parse(subject.body).first['id']).to eq(Post.top_rated.first.id)
    end
  end

  describe 'GET #ip_list' do
    subject { get :ip_list, { format: :json } }

    it { expect(subject.content_type).to eq 'application/json' }
    it { expect(subject.status).to eq 200 }
  end

end
