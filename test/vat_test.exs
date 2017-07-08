defmodule VatTest do
  use ExUnit.Case
  doctest Vat

  describe "Austria" do
    test "Valid VAT number provided" do
      assert Vat.valid?("AT", "U123456789") == true
    end

    test "Invalid VAT number, first charachter not U" do
      assert Vat.valid?("AT", "Y123456789") == false
    end

    test "Invalid VAT number, too many digits" do
      assert Vat.valid?("AT", "U12345678910") == false
    end

    test "Invalid VAT number, not enough digits" do
      assert Vat.valid?("AT", "U12345678") == false
    end

    test "Invalid VAT number, not digits after first charachter" do
      assert Vat.valid?("AT", "U123K5678") == false
    end
  end
end
