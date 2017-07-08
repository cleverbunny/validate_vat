# ValidateVat


Check if VAT number has valid format.
This library is a super light weight and has a simple responsibility of
checking if provided VAT numbers have valid VAT format(structure). It doesn't
make any external calls to do the check.

If you need to check if a business is registered to trade cross-border within
the EU with the EU's VIES on the web tool. VIES (VAT Information Exchange System)
is a search engine (not a database) owned by the European Commission.
The data is retrieved from national VAT databases when a search is made from
the VIES [tool](http://europa.eu/youreurope/business/vat-customs/check-number-vies/index_en.htm#)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `validate_vat` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:validate_vat, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/validate_vat](https://hexdocs.pm/validate_vat).


## Usage 

Check if VAT number has valid format by passing country code and VAT number to the function:

```elixir
iex> Vat.valid?("AT", "U123456789")
true
```

