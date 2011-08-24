class Createuser < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :name, :limit => 100
      t.string :email, :limit => 200
      t.string :password_digest, :limit => 100
      t.timestamps
    end
  end

end
