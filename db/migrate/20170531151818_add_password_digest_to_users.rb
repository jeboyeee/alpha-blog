class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    # should be password_digest to work (gem)
    add_column :users, :password_digest, :string
  end
end
