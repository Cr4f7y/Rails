class Message < ActiveRecord::Base
  belongs_to :client, class_name: "Client"
end
