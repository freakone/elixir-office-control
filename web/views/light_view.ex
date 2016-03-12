defmodule OfficeElixir.LightView do
  use OfficeElixir.Web, :view

  def render("index.json", %{lights: lights}) do
    render_many(lights, OfficeElixir.LightView, "light.json")
  end

  def render("show.json", %{light: light}) do
    render_one(light, OfficeElixir.LightView, "light.json")
  end

  def render("light.json", %{light: light}) do
    %{id: light.id,
      state: light.state,
      address: light.address,
      index: light.index,
      description: light.description,
      zone: light.zone}
  end
end
