# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
owner_articles = [{user_info: {name: 'alpesh'}, articles: [{name: 'iPhone 12SC Plus', price: '42', description: 'this is a revolution'}]}, 
			   			 		{user_info: {name: 'jonathan'}, articles: [{name: 'Death by Dessert', price: '45', description: 'So embarrassing, terror of minds.'}]},
			   				 	{user_info: {name: 'mateusz'}, articles: [{name: 'We read A Separate Peace in class', price: '50', description: 'Big description can be, We read A Separate Peace in class'},
			   				 																						{name: 'Jane got it right', price: '10.25', description: 'desc of Jane got it right'}]
			   				 	}]
Owner.destroy_all
Article.destroy_all
ActiveRecord::Base.connection.execute("DELETE FROM SQLITE_SEQUENCE WHERE NAME = 'owners' OR NAME = 'articles' ")
owner_articles.each do |owner_data|
	owner = Owner.create(owner_data[:user_info])
	owner_data[:articles].each do |article|
		article[:owner_id] = owner.id
		Article.create(article)
	end
end