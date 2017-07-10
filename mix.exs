defmodule ValidateVat.Mixfile do
  use Mix.Project

  def project do
    [app: :validate_vat,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package(),
     description: description(),
     deps: deps(),
     docs: docs(),
     source_url: "https://github.com/cleverbunny/validate_vat"
    ]
  end

  def application do
    [extra_applications: []]
  end

  defp deps do
    [
      {:earmark, "~> 1.2", only: :dev},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false}
    ]
  end

  defp package do
    [mainteiners: ["Tetiana Dushenkivska", "Keith Salisbury"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/cleverbunny/validate_vat"}
    ]
  end

  defp description do
    "Validates the format of VAT numbers"
  end

  defp docs do
    [main: "Vat",
     logo: "Bunny5.4.png"
    ]
  end
end
