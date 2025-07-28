# frozen_string_literal: true

class CharacterBlueprint < Blueprinter::Base

  identifier :id

  fields :title, :content

  view :normal do
    association :player, blueprint: PlayerBlueprint, view: :normal
  end
end
