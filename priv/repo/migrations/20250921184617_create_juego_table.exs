defmodule Mus.Repo.Migrations.CreateJuegoTable do
  use Ecto.Migration

  def change do
    create table(:juego) do
      add :partida_id, references(:partida, on_delete: :delete_all), null: false
    end

    create index(:juego, [:partida_id])
  end
end
