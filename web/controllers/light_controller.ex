defmodule OfficeElixir.LightController do
  use OfficeElixir.Web, :controller

  alias OfficeElixir.Light

  plug :scrub_params, "light" when action in [:create, :update]

  def index(conn, _params) do
    lights = Repo.all(Light)
    render(conn, "index.json", lights: lights)
  end

  def create(conn, %{"light" => light_params}) do
    changeset = Light.changeset(%Light{}, light_params)

    case Repo.insert(changeset) do
      {:ok, light} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", light_path(conn, :show, light))
        |> render("show.json", light: light)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(OfficeElixir.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "light" => light_params}) do
    light = Repo.get!(Light, id)
    changeset = Light.changeset(light, light_params)

    case Repo.update(changeset) do
      {:ok, light} ->
        render(conn, "show.json", light: light)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(OfficeElixir.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
