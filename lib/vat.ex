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

      iex> Vat.valid?("AT", "U123456789")
      true

  """

  @spec valid?(binary, binary) :: boolean
  def valid?("AT", vat_number), do: Regex.match?(~r/^U\d{9}$/i, vat_number)
  def valid?("BE", vat_number), do: Regex.match?(~r/^0\d{10}$/i, vat_number)
  def valid?("BG", vat_number), do: Regex.match?(~r/^(\d{9}|\d{10})$/i, vat_number)
  def valid?("CY", vat_number), do: Regex.match?(~r/^\d{8}\w$/i, vat_number)
end
