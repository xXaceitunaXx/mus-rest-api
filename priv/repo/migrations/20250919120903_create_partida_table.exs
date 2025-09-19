defmodule Mus.Repo.Migrations.CreatePartidaTable do
  use Ecto.Migration

  def change do
    create table(:partida) do

      add :pareja1_id, references(:pareja), null: false
      add :pareja2_id, references(:pareja), null: false

      timestamps()
    end

    create constraint(:partida, :different_parejas,
      check: "pareja1_id != pareja2_id"
    )
  end
end
