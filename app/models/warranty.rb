class Warranty < ActiveRecord::Base
  belongs_to :product

  mount_uploader :document, DocumentUploader
end
