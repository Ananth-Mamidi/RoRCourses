class CreateTutors < ActiveRecord::Migration[6.1]
  def change
    create_table :tutors do |t|
      t.string :name
      t.column :course_id, "bigint unsigned", :null => false
      t.timestamps
    end
  end
end
