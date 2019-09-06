defmodule Wormhole.Mixfile do
  use Mix.Project

  def project do
    [app: :wormhole,
     version: "2.3.0",
     elixir: "~> 1.7",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  def application do
    [applications: [:logger],
     mod: {Wormhole.Application, []}]
  end

  defp deps do
    [
      {:logger_file_backend, "~> 0.0.11", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev},
    ]
  end

  defp description do
    """
    Wormhole captures anything that is emitted out of the callback
    (return value or any kind of exception) and transfers it
    to the calling process in the form {:ok, state} or {:error, reason}.
    """
  end

  defp package do
    [
      maintainers: ["Predrag Rakic"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/renderedtext/wormhole"}
    ]
  end
end
