defmodule VatTest do
  use ExUnit.Case
  doctest Vat

  describe "Austria" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("AT", "U123456789") == true
      assert Vat.valid_format?("AT", "u123456789") == true
    end

    test "Invalid format VAT number, first charachter not U" do
      assert Vat.valid_format?("AT", "Y123456789") == false
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("AT", "U12345678910") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("AT", "U12345678") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("AT", "U123K5678") == false
    end
  end

  describe "Belgium" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("BE", "01234567890") == true
    end

    test "Invalid format VAT number, first charachter not 0" do
      assert Vat.valid_format?("BE", "m123456789") == false
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("BE", "012345678910") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("BE", "012345678") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("BE", "0123K5678") == false
    end
  end

  describe "Bulgaria" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("BG", "0123456789") == true
      assert Vat.valid_format?("BG", "1234567890") == true
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("BG", "012345678910") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("BG", "12345678") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("BG", "123K56789") == false
    end
  end

  describe "Cyprus" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("CY", "12345678m") == true
      assert Vat.valid_format?("CY", "12345678T") == true
    end

    test "Invalid format VAT number, last charachter not a letter" do
      assert Vat.valid_format?("CY", "12345678?") == false
      assert Vat.valid_format?("CY", "123456789") == false
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("CY", "012345678910") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("CY", "12345678") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("CY", "123K56789") == false
    end
  end

  describe "Czech Republic" do
    test "Valid format VAT number provided" do
      assert Vat.valid_format?("CZ", "12345678") == true
      assert Vat.valid_format?("CZ", "123456789") == true
      assert Vat.valid_format?("CZ", "1234567890") == true
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("CZ", "012345678910") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("CZ", "1234567") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("CZ", "123K56789") == false
    end
  end

  describe "Germany" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("DE", "123456789") == true
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("DE", "012345678910") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("DE", "12345678") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("DE", "123K56789") == false
    end
  end

  describe "Denmark" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("DK", "12345678") == true
      assert Vat.valid_format?("DK", "12 34 56 78") == true
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("DK", "012345678910") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("DK", "1234567") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("DK", "123K56789") == false
    end
  end

  describe "Estonia" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("EE", "123456789") == true
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("EE", "012345678910") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("EE", "12345678") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("EE", "123K56789") == false
    end
  end

  describe "Greece" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("EL", "123456789") == true
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("EL", "1234567890") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("EL", "12345678") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("EL", "123K56789") == false
    end
  end

  describe "Spain" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("ES", "P23456789") == true
      assert Vat.valid_format?("ES", "12345678P") == true
    end

    test "Invalid format VAT number, first or last char incorrect" do
      assert Vat.valid_format?("ES", "123456789") == false
      assert Vat.valid_format?("ES", "!23456789") == false
      assert Vat.valid_format?("ES", "12345678?") == false
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("ES", "1234567890") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("ES", "12345678") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("ES", "123K56789") == false
    end
  end

  describe "Finland" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("FI", "12345678") == true
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("FI", "123456789") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("FI", "1234567") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("FI", "123K5678") == false
    end
  end
end
