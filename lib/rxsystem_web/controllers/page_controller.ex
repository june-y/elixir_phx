defmodule RxsystemWeb.PageController do
  use RxsystemWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
