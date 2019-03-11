defmodule Timex.ConvertErrorTest do
  use ExUnit.Case, async: true

  alias Timex.ConvertError

  describe "exception/1" do
    test "insufficient_date_information" do
      assert %ConvertError{message: "unable to convert value, insufficient date/time information"} =
               ConvertError.exception({:error, :insufficient_date_information})
    end

    test "expected_integer" do
      assert %ConvertError{
               message:
                 "unable to convert value, expected integer for :milliseconds, but got \"not_int\""
             } =
               ConvertError.exception(
                 {:error, {:expected_integer, for: :milliseconds, got: "not_int"}}
               )
    end

    test "error tuple" do
      assert %ConvertError{message: "unable to convert value: \"reason\""} =
               ConvertError.exception({:error, "reason"})
    end

    test "other reasons" do
      assert %ConvertError{message: "unable to convert value: \"reason\""} =
               ConvertError.exception("reason")
    end
  end
end
