class Warranty < ActiveRecord::Base
  belongs_to :product

  mount_uploader :document, DocumentUploader

  def end_date
    if lifetime
      "Never"
    else
      self.purchase_date + duration.months if duration
    end
  end

  def expired
    end_date < Time.now unless lifetime
  end
end
