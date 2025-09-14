defmodule Mus.Schemas.Jugador do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "jugador" do
    field :usuario, :string,
      primary_key: true
    field :apodo, :string
    many_to_many :parejas, Mus.Schemas.Jugador,
      join_through: Mus.Schemas.Pareja,
      join_keys: [este_usuario: :usuario, aquel_usuario: :usuario]
  end

  def changeset(jugador, attrs) do
    jugador
      |> cast(attrs, [:usuario, :apodo])
      |> validate_required([:usuario, :apodo])
  end
end
