require 'rails_helper'

describe ArticlesController do
	describe '#index' do
		subject { get :index }
		it 'should return success response' do
			subject
			expect(response).to have_http_status(:ok)
		end

		it 'should return proper json' do
			create_list :article, 2
			subject
			Article.recent.each_with_index do |article, index|
				expect(json[index]).to include({
					"title"=> article.title, 
					"content"=> article.content, 
					"slug"=> article.slug
				})
			end
		end

		it 'should return articles in the proper order' do
			old_article = create :article
			newer_article = create :article
			subject
			expect(json.first['id']).to eq(newer_article.id)
			expect(json.last['id']).to eq(old_article.id)
		end
	end
end