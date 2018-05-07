class Comment < ApplicationRecord
  ## sets up active record association due to :references in bash command
  belongs_to :article
end
