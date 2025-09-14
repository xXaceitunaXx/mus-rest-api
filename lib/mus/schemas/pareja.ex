defmodule Mus.Schemas.Pareja do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "pareja" do
    belongs_to :este, Mus.Schemas.Jugador,
      foreign_key: :este_usuario,
      references: :usuario,
      type: :string,
      primary_key: true

    belongs_to :aquel, Mus.Schemas.Jugador,
      foreign_key: :aquel_usuario,
      references: :usuario,
      type: :string,
      primary_key: true
  end

  def changeset(pareja, attrs) do
    pareja
      |> cast(attrs, [:este_usuario, :aquel_usuario])
      |> validate_required([:este_usuario, :aquel_usuario])
      |> validate_different_players
      |> normalize_order
      |> foreign_key_constraint(:este_usuario)
      |> foreign_key_constraint(:aquel_usuario)
  end

  defp validate_different_players(changeset) do
    case extract_usernames(changeset) do
      {same, same} when not is_nil(same) -> add_error(changeset, :otro_usuario, "Un jugador no puede hacer pareja consigo mismo")
      _ -> changeset
    end
  end

  defp normalize_order(changeset) do
    case extract_usernames(changeset) do
      {este, aquel} when este > aquel -> changeset |> put_change(:este_usuario, aquel) |> put_change(:aquel_usuario, este)
      _ -> changeset
    end
  end

  defp extract_usernames(changeset) do
    {
      get_change(changeset, :este_usuario) || get_field(changeset, :este_usuario),
      get_change(changeset, :aquel_usuario) || get_field(changeset, :aquel_usuario)
    }
  end
end
