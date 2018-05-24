class FileToUpdateFilePackage < ApplicationRecord
  belongs_to :file_to_update
  belongs_to :file_package
end
