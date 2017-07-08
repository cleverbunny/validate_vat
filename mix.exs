defmodule ValidateVat.Mixfile do
  use Mix.Project

  def project do
    [app: :validate_vat,
     version: "0.0.1",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package(),
     description: description(),
     deps: deps()]
  end

  def application do
    [extra_applications: []]
  end

  defp deps do
    []
  end

  defp package do
    [mainteiners: ["Tetiana Dushenkivska", "Keith Salisbury"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/cleverbunny/validate_vat"}
    ]
  end

  defp description do
    "Check validity of VAT numbers"
  end
end
