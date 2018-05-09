class AddAttachmentLogoToConcesionaria < ActiveRecord::Migration
  def self.up
    change_table :concesionaria do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :concesionaria, :logo
  end
end
