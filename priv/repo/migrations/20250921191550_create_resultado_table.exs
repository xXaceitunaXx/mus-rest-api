defmodule Mus.Repo.Migrations.CreateResultadoTable do
  use Ecto.Migration

  def change do
    create table(:resultado, primary_key: false) do
      add :puntos, :smallint, null: false
      add :juego_id, references(:juego), null: false
      add :pareja_id, references(:pareja), null: false
    end

    create constraint(:resultado, :puntos_no_negativos,
      check: "puntos >= 0"
    )

    create constraint(:resultado, :puntos_no_grandes,
      check: "puntos <= 40"
    )

    # TODO Esto ya pensaré en como arreglarlo xd

    # create constraint(:resultado, :dos_resultados_por_juego,
    #   check: "SELECT COUNT(*) FROM resultado r WHERE r.juego_id = juego_id <= 2"
    # )

    # create constraint(:resultado, :pareja_participa_en_partida,
    #   check: """
    #     EXISTS (
    #       SELECT 1
    #       FROM juego j
    #       JOIN partida p ON j.partida_id = p.id
    #       WHERE j.id = juego_id
    #       AND (p.pareja1_id = pareja_id OR p.pareja2_id = pareja_id)
    #     )
    #   """
    # )

    # Creo que simplemente no puedo hacer consultas sobre otras tablas en sql
    # dentro de CHECK, tendré que crear un trigger...
  end
end
