defmodule OfficeElixir.LightControllerTest do
  use OfficeElixir.ConnCase
  alias OfficeElixir.Light
  @valid_attrs %{address: 42, description: "some content", index: 42, state: true, zone: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end


  test "lists all entries on index", %{conn: conn} do
    conn = get conn, light_path(conn, :index)
    assert json_response(conn, 200) == []
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, light_path(conn, :create), light: @valid_attrs
    assert json_response(conn, 201)["id"]
    assert Repo.get_by(Light, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, light_path(conn, :create), light: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    light = Repo.insert! %Light{}
    conn = put conn, light_path(conn, :update, light), light: @valid_attrs
    assert json_response(conn, 200)["id"]
    assert Repo.get_by(Light, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    light = Repo.insert! %Light{}
    conn = put conn, light_path(conn, :update, light), light: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end
end
