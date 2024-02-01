defmodule Meteor.Skills.Skill do
  @derive {Jason.Encoder, only: [:id, :category, :description, :name]}
  use Ecto.Schema
  import Ecto.Changeset

  schema "skills" do
    field :category, :string
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(skill, attrs) do
    skill
    |> cast(attrs, [:name, :category, :description])
    |> validate_required([:name, :category, :description])
  end
end
