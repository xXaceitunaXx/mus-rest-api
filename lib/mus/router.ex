defmodule Mus.Router do
  alias Mus.Controllers.HelloController
  alias Mus.Controllers.SessionController
  alias Mus.Controllers.JugadoresController
  alias Mus.Controllers.PartidasController

  use Plug.Router

  plug :match
  plug :dispatch

  get "/", do: HelloController.index(conn)

  # TODO implementar la funcionalidad, creo que hay que hacer mas cosas, un get de parejas por ejemplo
  # pensar en esto cuando conozcamos bien los casos de uso de la app

  get "/partida/:id", do: PartidasController.get_partida(conn)

  get "/:jugador", do: JugadoresController.get_jugador(conn)

  post "/login", do: SessionController.add_session(conn)

  post "/partida", do: PartidasController.save_partida(conn)

  match _, do: send_resp(conn, 404, "órdago a chicas...\n")
end
