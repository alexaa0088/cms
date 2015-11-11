class AddAttachmentAvatarToSections < ActiveRecord::Migration
  def self.up
    change_table :sections do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :sections, :avatar
  end
end
