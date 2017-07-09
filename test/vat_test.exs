defmodule VatTest do
  use ExUnit.Case
  doctest Vat

  describe "Austria" do
    test "Valid VAT number provided" do
      assert Vat.valid?("AT", "U123456789") == true
      assert Vat.valid?("AT", "u123456789") == true
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

  describe "Belgium" do
    test "Valid VAT number provided" do
      assert Vat.valid?("BE", "01234567890") == true
    end

    test "Invalid VAT number, first charachter not 0" do
      assert Vat.valid?("BE", "m123456789") == false
    end

    test "Invalid VAT number, too many digits" do
      assert Vat.valid?("BE", "012345678910") == false
    end

    test "Invalid VAT number, not enough digits" do
      assert Vat.valid?("BE", "012345678") == false
    end

    test "Invalid VAT number, not digits after first charachter" do
      assert Vat.valid?("BE", "0123K5678") == false
    end
  end

  describe "Bulgaria" do
    test "Valid VAT number provided" do
      assert Vat.valid?("BG", "0123456789") == true
      assert Vat.valid?("BG", "1234567890") == true
    end

    test "Invalid VAT number, too many digits" do
      assert Vat.valid?("BG", "012345678910") == false
    end

    test "Invalid VAT number, not enough digits" do
      assert Vat.valid?("BG", "12345678") == false
    end

    test "Invalid VAT number, not digits after first charachter" do
      assert Vat.valid?("BG", "123K56789") == false
    end
  end

  describe "Cyprus" do
    test "Valid VAT number provided" do
      assert Vat.valid?("CY", "12345678m") == true
      assert Vat.valid?("CY", "12345678T") == true
    end

    test "Invalid VAT number, last charachter not a letter" do
      assert Vat.valid?("CY", "123456789?") == false
      assert Vat.valid?("CY", "1234567891") == false
    end

    test "Invalid VAT number, too many digits" do
      assert Vat.valid?("CY", "012345678910") == false
    end

    test "Invalid VAT number, not enough digits" do
      assert Vat.valid?("CY", "12345678") == false
    end

    test "Invalid VAT number, not digits after first charachter" do
      assert Vat.valid?("CY", "123K56789") == false
    end
  end
end
