class AddAttachmentAdjuntoToReunions < ActiveRecord::Migration
  def self.up
    change_table :reunions do |t|
      t.attachment :adjunto
    end
  end

  def self.down
    remove_attachment :reunions, :adjunto
  end
end
