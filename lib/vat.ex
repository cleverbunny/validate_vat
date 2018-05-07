defmodule Vat do
  @moduledoc """
  Check if VAT number has valid format.
  This library is a super light weight and has a simple responsibility of
  checking if provided VAT numbers have valid VAT format(structure). It doesn't
  make any external calls to do the check.

  If you need to check if a business is registered to trade cross-border within
  the EU with the EU's VIES on the web tool. VIES (VAT Information Exchange System)
  is a search engine (not a database) owned by the European Commission.
  The data is retrieved from national VAT databases when a search is made from
  the VIES tool.
  """

  @doc """
  Validate VAT number

  ## Examples

      iex> Vat.valid_format?("AT", "U123456789")
      true

  """

  @spec valid_format?(binary, binary) :: boolean
  def valid_format?("AT", vat_number), do: Regex.match?(~r/^U\d{9}$/, vat_number)
  def valid_format?("BE", vat_number), do: Regex.match?(~r/^0\d{10}$/, vat_number)
  def valid_format?("CY", vat_number), do: Regex.match?(~r/^\d{8}[A-z]$/, vat_number)
  def valid_format?("DE", vat_number), do: Regex.match?(~r/^\d{9}$/, vat_number)
  def valid_format?("EE", vat_number), do: Regex.match?(~r/^\d{9}$/, vat_number)
  def valid_format?("EL", vat_number), do: Regex.match?(~r/^\d{9}$/, vat_number)
  def valid_format?("FI", vat_number), do: Regex.match?(~r/^\d{8}$/, vat_number)
  def valid_format?("HR", vat_number), do: Regex.match?(~r/^\d{11}$/, vat_number)
  def valid_format?("HU", vat_number), do: Regex.match?(~r/^\d{8}$/, vat_number)
  def valid_format?("IT", vat_number), do: Regex.match?(~r/^\d{11}$/, vat_number)
  def valid_format?("LU", vat_number), do: Regex.match?(~r/^\d{8}$/, vat_number)
  def valid_format?("LV", vat_number), do: Regex.match?(~r/^\d{11}$/, vat_number)
  def valid_format?("MT", vat_number), do: Regex.match?(~r/^\d{8}$/, vat_number)
  def valid_format?("NL", vat_number), do: Regex.match?(~r/^\d{9}B\d{2}$/, vat_number)
  def valid_format?("PL", vat_number), do: Regex.match?(~r/^\d{10}$/, vat_number)
  def valid_format?("PT", vat_number), do: Regex.match?(~r/^\d{9}$/, vat_number)
  def valid_format?("RO", vat_number), do: Regex.match?(~r/^\d{2,10}$/, vat_number)
  def valid_format?("SE", vat_number), do: Regex.match?(~r/^\d{12}$/, vat_number)
  def valid_format?("SI", vat_number), do: Regex.match?(~r/^\d{8}$/, vat_number)
  def valid_format?("SK", vat_number), do: Regex.match?(~r/^\d{10}$/, vat_number)

  def valid_format?("BG", vat_number) do
    Regex.match?(~r/^(\d{9}|\d{10})$/, vat_number)
  end

  def valid_format?("CZ", vat_number) do
    Regex.match?(~r/^(\d{8}|\d{9}|\d{10})$/, vat_number)
  end

  def valid_format?("DK", vat_number) do
    Regex.match?(~r/^\d{8}$/, String.replace(vat_number, " ", ""))
  end

  def valid_format?("ES", vat_number) do
    Regex.match?(~r/(^[A-z]\d{8}$|^\d{8}[A-z]$)/, vat_number)
  end

  def valid_format?("FR", vat_number) do
    Regex.match?(~r/^[A-z0-9]{2}\d{9}$/, vat_number)
  end

  def valid_format?("GB", vat_number) do
    format1 = Regex.match?(~r/(^(\d{9}|\d{12})$)/, String.replace(vat_number, " ", ""))
    format2 = Regex.match?(~r/^(GD|HA)\d{3}$/, vat_number)
    format1 || format2
  end

  def valid_format?("IE", vat_number) do
    format1 = Regex.match?(~r/^\d[A-z0-9+*]\d{5}[A-z]$/, vat_number)
    format2 = Regex.match?(~r/^\d{7}WI$/, vat_number)
    format1 || format2
  end

  def valid_format?("LT", vat_number) do
    Regex.match?(~r/^(\d{9}|\d{12})$/, vat_number)
  end

  def valid_format?(_, _), do: false
end
