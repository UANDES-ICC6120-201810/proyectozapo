class FileToUpdate < ApplicationRecord
  has_one_attached :file
  validate :file_validation

  private

  def file_validation
    if !file.attached?
      file.purge
      errors[:base] << "file attached must exist"
    end
  end
end
