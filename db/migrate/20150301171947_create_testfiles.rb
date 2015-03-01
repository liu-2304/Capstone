class CreateTestfiles < ActiveRecord::Migration
  def change
    create_table :testfiles do |t|
      t.string :filename
      t.string :content_type
      t.binary :file_contents
      t.integer :confidence_rank

      t.timestamps null: false
    end
  end
end
