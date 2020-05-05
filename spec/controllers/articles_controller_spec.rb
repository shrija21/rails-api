require 'rails_helper'

describe ArticlesController do
	describe '#index' do
		it 'should return success response' do
			get :index
			expect(response).to have_http_status(:ok)
		end

		it 'should return proper json' do
			create_list :article, 2
			get :index
			json = JSON.parse(response.body)
			p json
			expect(json.length).to eq(2)
			expect(json[0]).to include({
				"title"=>"My awesome article 1", 
				"content"=>"The content of my awesome article 1", 
				"slug"=>"my-awesome-article-1"
			})
			expect(json[1]).to include({
				"title"=>"My awesome article 2", 
				"content"=>"The content of my awesome article 2", 
				"slug"=>"my-awesome-article-2"
			})
		end
	end
end