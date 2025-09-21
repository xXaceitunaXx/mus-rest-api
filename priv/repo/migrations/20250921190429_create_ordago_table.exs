defmodule Mus.Repo.Migrations.CreateOrdagoTable do
  use Ecto.Migration

  def change do
    create_query = "CREATE TYPE tipo_lance AS ENUM ('grandes', 'chicas', 'par', 'juego')"
    drop_query = "DROP TYPE tipo_lance"

    execute create_query, drop_query

    create table(:ordago, primary_key: false) do
      add :lance, :tipo_lance, null: false
      add :ganado, :boolean, null: false, default: false
      add :juego_id, references(:juego, on_delete: :delete_all), primary_key: true, null: false
      add :jugador_usuario, references(:jugador, column: :usuario, type: :string), null: false
    end

    # TODO crear constraint de que jugador tiene que ser miembro de una de las parejas que están en la partida
  end
end
