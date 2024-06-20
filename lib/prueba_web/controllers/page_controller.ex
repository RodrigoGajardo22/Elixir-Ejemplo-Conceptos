defmodule PruebaWeb.PageController do
  use PruebaWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def boton(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :boton, layout: false)
  end

  def valor(conn, _params) do
    count = get_session(conn, :count) || 0
    render(conn, :valor, count: count, layout: false)
  end

def incrementar(conn, _params) do
  count = get_session(conn, :count) || 0
  new_count = count + 1
  conn
  |> put_session(:count, new_count)
  |> json(%{count: new_count})
end

end
