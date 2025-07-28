# frozen_string_literal: true

class PlayerBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    fields :username, :password
  end

  view :player do
    association :character, blueprint: CharacterBlueprint
  end
end
