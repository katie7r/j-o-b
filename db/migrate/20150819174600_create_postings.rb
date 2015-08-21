class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.string :quickname
      t.string :job_title, null: false
      t.string :job_url, null: false
      t.string :company
      t.string :company_url
      t.text :description
      t.text :requirements
      t.text :notes
      t.boolean :remote, default: false
      t.boolean :full_time, default: true
      t.integer :priority, default: 0
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
