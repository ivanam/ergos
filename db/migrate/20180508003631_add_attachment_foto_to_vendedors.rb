class AddAttachmentFotoToVendedors < ActiveRecord::Migration
  def self.up
    change_table :vendedors do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :vendedors, :foto
  end
end


