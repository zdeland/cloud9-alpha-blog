class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      # manually entered
      t.string :title
      
    end
  end
end
