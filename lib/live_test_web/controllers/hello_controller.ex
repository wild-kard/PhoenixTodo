defmodule LiveTestWeb.HelloController do
  use LiveTestWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
