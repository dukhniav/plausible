defimpl Bamboo.Formatter, for: Plausible.Auth.User do
  def format_email_address(user, _opts) do
    {user.name, user.email}
  end
end

defmodule Plausible.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password_hash
    field :password, :string, virtual: true
    field :name, :string
    field :last_seen, :naive_datetime

    has_many :site_memberships, Plausible.Site.Membership
    has_many :sites, through: [:site_memberships, :site]
    has_one :google_auth, Plausible.Site.GoogleAuth

    timestamps()
  end

  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [:email, :name])
    |> validate_required([:email, :name])
    |> unique_constraint(:email)
  end

  def set_password(user, password) do
    hash = Plausible.Auth.Password.hash(password)

    user
    |> cast(%{password: password}, [:password])
    |> validate_required(:password)
    |> validate_length(:password, min: 6)
    |> cast(%{password_hash: hash}, [:password_hash])
  end
end
