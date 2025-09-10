defmodule Mus.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "Hello, world!")
  end

  get "/tonto" do
    send_resp(conn, 200, "Tu mas >:(")
  end

  get "/:name" do
    send_resp(conn, 200, "Hola #{name} juju")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
