class Note < ActiveRecord::Base
  belongs_to :client, class_name: "Client"
end
