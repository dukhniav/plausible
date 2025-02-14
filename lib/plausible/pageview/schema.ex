defmodule Plausible.Pageview do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pageviews" do
    field :hostname, :string
    field :pathname, :string
    field :referrer, :string
    field :raw_referrer, :string
    field :user_agent, :string
    field :screen_width, :integer
    field :screen_size, :string
    field :new_visitor, :boolean
    field :user_id, :binary_id
    field :country_code, :string

    field :operating_system, :string
    field :browser, :string
    field :referrer_source, :string

    timestamps()
  end

  def changeset(pageview, attrs) do
    pageview
    |> cast(attrs, [:hostname, :pathname, :referrer, :raw_referrer, :user_agent, :new_visitor, :screen_width, :user_id, :operating_system, :browser, :referrer_source, :country_code, :screen_size])
    |> validate_required([:hostname, :pathname, :new_visitor, :user_id])
  end
end
