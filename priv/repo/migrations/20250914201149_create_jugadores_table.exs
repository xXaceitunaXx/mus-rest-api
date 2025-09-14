defmodule Mus.Repo.Migrations.CreateJugadorTable do
  use Ecto.Migration

  def change do
    create table(:jugador, primary_key: false) do
      add :usuario, :string, primary_key: true, null: false
      add :apodo, :string, null: false
    end

    # Constraint para asegurar que usuario no esté vacío
    create constraint(:jugador, :usuario_not_empty,
      check: "length(trim(usuario)) > 0"
    )

    # Constraint para asegurar que apodo no esté vacío
    create constraint(:jugador, :apodo_not_empty,
      check: "length(trim(apodo)) > 0"
    )
  end
end
