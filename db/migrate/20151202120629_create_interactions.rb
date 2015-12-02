class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.references :user, null: false
      t.references :film, null: false
      t.integer :interaction_type, null: false
      t.integer :value, null: false
      t.datetime :updated_at, :created_at, null: false
    end
  end
end
