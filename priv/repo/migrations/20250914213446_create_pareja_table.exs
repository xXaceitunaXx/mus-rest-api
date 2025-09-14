defmodule Mus.Repo.Migrations.CreateParejaTable do
  use Ecto.Migration

  def change do
    create table(:pareja, primary_key: false) do
      add :este_usuario, references(:jugador, column: :usuario, type: :string),
          null: false, primary_key: true
      add :aquel_usuario, references(:jugador, column: :usuario, type: :string),
          null: false, primary_key: true
    end

    # Constraint para asegurar que este_usuario < aquel_usuario (orden alfabético)
    create constraint(:pareja, :ordered_usuarios,
      check: "este_usuario < aquel_usuario"
    )

    # Constraint adicional para evitar que un jugador haga pareja consigo mismo
    # (aunque ya está cubierto por el constraint de orden, es buena práctica)
    create constraint(:pareja, :different_usuarios,
      check: "este_usuario != aquel_usuario"
    )
  end
end
