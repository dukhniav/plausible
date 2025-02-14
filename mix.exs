defmodule Plausible.MixProject do
  use Mix.Project

  def project do
    [
      app: :plausible,
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()), compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Plausible.Application, []},
      extra_applications: [:logger, :sentry, :runtime_tools, :timex, :ua_inspector, :ref_inspector, :bamboo]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:browser, "~> 0.4.3"},
      {:bcrypt_elixir, "~> 2.0"},
      {:cors_plug, "~> 1.5"},
      {:ecto_sql, "~> 3.0"},
      {:elixir_uuid, "~> 1.2"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:phoenix, "~> 1.4.0"},
      {:phoenix_active_link, "~> 0.2.1"},
      {:phoenix_ecto, "~> 4.0"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_pubsub, "~> 1.1"},
      {:plug_cowboy, "~> 2.0"},
      {:postgrex, ">= 0.0.0"},
      {:ref_inspector, "~> 1.0"},
      {:timex, "~> 3.5"},
      {:ua_inspector, "~> 0.18"},
      {:bamboo, "~> 1.2"},
      {:bamboo_postmark, "~> 0.5"},
      {:poison, ">= 1.5.0"}, # For bamboo_postmark
      {:sentry, "~> 7.0"},
      {:httpoison, "~> 1.4"},
      {:ex_machina, "~> 2.3", only: :test},
      {:appsignal, "~> 1.0"},
      {:joken, "~> 2.0"},
      {:php_serializer, "~> 0.9.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
