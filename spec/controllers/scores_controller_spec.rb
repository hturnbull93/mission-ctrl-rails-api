require 'rails_helper'

RSpec.describe ScoresController, type: :controller do

  it "GET /scores returns all scores, sorted by score " do
    Score.create(name: "Dave", score: 100)
    Score.create(name: "Pete", score: 80)
    Score.create(name: "Jim", score: 90)
    get :index

    json = JSON.parse(response.body)

    expect(response).to have_http_status(200)

    expect(json[0]['score']).to eq 100
    expect(json[1]['score']).to eq 90
    expect(json[2]['score']).to eq 80
  end


  it 'POST /scores submits a score' do
    post :create, params: {
      name: "Dave",
      score: 100
    }

    json = JSON.parse(response.body)

    expect(json['score']).to eq 100
    expect(json['name']).to eq "Dave"
  end
end
