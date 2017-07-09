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
  def valid_format?("AT", vat_number), do: Regex.match?(~r/^U\d{9}$/i, vat_number)
  def valid_format?("BE", vat_number), do: Regex.match?(~r/^0\d{10}$/i, vat_number)
  def valid_format?("CY", vat_number), do: Regex.match?(~r/^\d{8}[A-z]$/i, vat_number)
  def valid_format?("DE", vat_number), do: Regex.match?(~r/^\d{9}$/i, vat_number)
  def valid_format?("EE", vat_number), do: Regex.match?(~r/^\d{9}$/i, vat_number)
  def valid_format?("EL", vat_number), do: Regex.match?(~r/^\d{9}$/i, vat_number)
  def valid_format?("FI", vat_number), do: Regex.match?(~r/^\d{8}$/i, vat_number)

  def valid_format?("BG", vat_number) do
    Regex.match?(~r/^(\d{9}|\d{10})$/i, vat_number)
  end

  def valid_format?("CZ", vat_number) do
    Regex.match?(~r/^(\d{8}|\d{9}|\d{10})$/i, vat_number)
  end

  def valid_format?("DK", vat_number) do
    Regex.match?(~r/^\d{8}$/i, String.replace(vat_number, " ", ""))
  end

  def valid_format?("ES", vat_number) do
    Regex.match?(~r/(^[A-z]\d{8}$|^\d{8}[A-z]$)/i, vat_number)
  end

  def valid_format?("FR", vat_number) do
    Regex.match?(~r/^[A-z0-9]{2}\d{9}$/i, vat_number)
  end

  def valid_format?("GB", vat_number) do
    format1 = Regex.match?(~r/(^\d{9}$|^\d{12}$)/i, String.replace(vat_number, " ", ""))
    format2 = Regex.match?(~r/^(GD|HA)\d{3}$/i, vat_number)
    format1 || format2
  end
end
