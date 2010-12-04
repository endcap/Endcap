class AddEditorToUsers < ActiveRecord::Migration
  def self.up
		add_column :users, :editor, :boolean, :default => 0
		add_column :users, :superuser, :boolean, :default => 0
  end

  def self.down
		remove_column :users, :editor
		remove_column :users, :superuser
  end
end
