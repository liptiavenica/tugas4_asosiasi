class Article < ActiveRecord::Base
validates :title, presence: true,
length: { minimum: 5 }
validates :content, presence: true,
length: { minimum: 10 }
validates :status, presence: true
default_scope {where(status: 'active')}

has_many :comments
validates_presence_of :content, :title, :status

 def self.to_csv(options = {})
 	CSV.generate(options) do |csv|
 		csv << column_names
 		all.each do |article|
 			csv << article.attributes.values_at(*column_names)
 		end
 	end
 end

 def self.import(file)
 	CSV.foreach(file.path, headers: true) do |row|
 		Article.create! row.to_hash
 	end
 end

 def self.search(query)
  # where(:title, query) -> This would return an exact match of the query
    where("title like ?", "%#{query}%") 
end
end
