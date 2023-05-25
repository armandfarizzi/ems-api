class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews, id: :string, charset: "utf8mb4" do |t|
      t.string :employee_id
      t.integer :rating
      t.text :comment

      t.timestamps
      t.index ["employee_id", "created_at"], name: "review_employee_id"
    end
  end
end
