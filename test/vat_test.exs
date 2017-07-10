defmodule VatTest do
  use ExUnit.Case
  doctest Vat

  describe "Austria" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("AT", "U123456789") == true
    end

    test "Invalid format VAT number, first charachter not U" do
      assert Vat.valid_format?("AT", "u123456789") == false
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

  describe "France" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("FR", "PR123456789") == true
      assert Vat.valid_format?("FR", "vm123456789") == true
      assert Vat.valid_format?("FR", "23123456789") == true
    end

    test "Invalid Format VAT number, first 2 chars incorrect" do
      assert Vat.valid_format?("FR", "?!123456789") == false
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("FR", "vm1234567890") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("FR", "vm12345678") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("FR", "vm123K56789") == false
    end
  end

  describe "United Kingdom" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("GB", "123 4567 89") == true
      assert Vat.valid_format?("GB", "123456789") == true

      assert Vat.valid_format?("GB", "123 4567 89 123") == true
      assert Vat.valid_format?("GB", "123456789123") == true

      assert Vat.valid_format?("GB", "GD123") == true
      assert Vat.valid_format?("GB", "HA123") == true
    end

    test "Invalid Format VAT number, first 2 chars incorrect" do
      assert Vat.valid_format?("GB", "?!123") == false
      assert Vat.valid_format?("GB", "BR123") == false
      assert Vat.valid_format?("GB", "gd123") == false 
      assert Vat.valid_format?("GB", "ha123") == false 
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("GB", "1234567891234") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("GB", "12345678") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("GB", "vm123K56789") == false
    end
  end

  describe "Croatia" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("HR", "12345678901") == true
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("HR", "123456789012") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("HR", "1234567890") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("HR", "123K5678901") == false
    end
  end

  describe "Hungary" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("HU", "12345678") == true
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("HU", "1234567") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("HU", "123456789") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("HU", "123K5678") == false
    end
  end

  describe "Ireland" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("IE", "1234567F") == true
      assert Vat.valid_format?("IE", "1T34567F") == true
      assert Vat.valid_format?("IE", "1+34567F") == true
      assert Vat.valid_format?("IE", "1*34567F") == true

      assert Vat.valid_format?("IE", "1234567WI") == true
    end

    test "Invalid Format VAT number, special chars incorrect" do
      assert Vat.valid_format?("IE", "12345678") == false 
      assert Vat.valid_format?("IE", "1?345678") == false 
      assert Vat.valid_format?("IE", "1B345678") == false 

      assert Vat.valid_format?("IE", "123456789") == false 
      assert Vat.valid_format?("IE", "1234567BR") == false 
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("IE", "1234567") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("IE", "1234567890") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("IE", "123K5678") == false
    end
  end

  describe "Italy" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("IT", "12345678901") == true
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("IT", "123456789012") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("IT", "1234567890") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("IT", "123K5678901") == false
    end
  end

  describe "Lithuania" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("LT", "123456789") == true
      assert Vat.valid_format?("LT", "123456789012") == true
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("LT", "1234567890123") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("LT", "12345678") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("LT", "123K56789") == false
    end
  end
  
  describe "Luxemburg" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("LU", "12345678") == true
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("LU", "123456789") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("LU", "1234567") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("LU", "123K5678") == false
    end
  end

  describe "Latvia" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("LV", "12345678901") == true
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("LV", "123456789012") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("LV", "1234567890") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("LV", "123K567890") == false
    end
  end

  describe "Malta" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("MT", "12345678") == true
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("MT", "123456789") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("MT", "1234567") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("MT", "123K5678") == false
    end
  end

  describe "The Netherlands" do
    test "Valid Format VAT number provided" do
      assert Vat.valid_format?("NL", "1234567890B2") == true
    end

    test "Invalid format VAT number, 10th char not B" do
      assert Vat.valid_format?("NL", "123456789012") == false
      assert Vat.valid_format?("NL", "123456789b12") == false
    end

    test "Invalid format VAT number, too many digits" do
      assert Vat.valid_format?("NL", "1234567890123") == false
    end

    test "Invalid format VAT number, not enough digits" do
      assert Vat.valid_format?("NL", "12345678901") == false
    end

    test "Invalid format VAT number, not digits after first charachter" do
      assert Vat.valid_format?("NL", "123K56789012") == false
    end
  end
end
