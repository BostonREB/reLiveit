class Artist < ActiveRecord::Base
  belongs_to :user

  BANDS = {
    "Drive-By Truckers" => "Drive-By Truckers",
    "My Morning Jacket" => "My Morning Jacket",
    "Umphreys McGee" => "Umphreys McGee",
    "Grace Potter and the Nocturnals" => "Grace Potter and the Nocturnals",
    "Yonder Mountain String Band" => "Yonder Mountain String Band",
    "Camper Van Beethoven" => "Camper Van Beethoven",
    "John Butler Trio" => "John Butler Trio"
  }
end
