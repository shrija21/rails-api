require 'rails_helper'

describe ArticlesController do
	describe '#index' do
		subject { get :index }
		it 'should return success response' do
			subject
			expect(response).to have_http_status(:ok)
		end

		it 'should return proper json' do
			articles = create_list :article, 2
			subject
			# json = JSON.parse(response.body)
			# p json
			# expect(json.length).to eq(2)
			articles.each_with_index do |article, index|
				expect(json[index]).to include({
					"title"=> article.title, 
					"content"=> article.content, 
					"slug"=> article.slug
				})
			end
		end
	end
end