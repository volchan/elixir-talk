defmodule ElixirTalk do
  def integer(int) do # 123
    IO.puts("#{int} is an Integer ? #{is_integer(int)}")
  end

  def float(float) do # 1.23
    IO.puts("#{float} is a Float ? #{is_float(float)}")
  end

  def string(string) do # "foo"
    IO.puts("#{string} is a String ? #{is_bitstring(string)}")
  end

  def atom(atom) do # :foo
    IO.puts("#{atom} is an Atom ? #{is_atom(atom)}")
  end

  def list(list) do # 'foo' ["foo", "bar", "baz"]
    IO.puts("#{list} is a List ? #{is_list(list)}")
  end

  def tuple(tuple) do # {:foo, :bar, :baz}
    IO.puts("Tuple ? #{is_tuple(tuple)}")
  end

  def user_name do
    name = IO.gets("What is your name ? ") |> String.trim
    IO.puts("Hello #{name}")
  end

  def string_methods(string) do
    IO.puts("Length : #{String.length(string)}")
    longer_string = string <> " " <> "is longer !"
    IO.puts(longer_string)
    IO.puts("My ? #{String.contains?(string, "My")}")
    IO.puts("First : #{String.first(string)}")
    IO.puts("Index 4 : #{String.at(string, 4)}")
    IO.puts("Substring : #{String.slice(string, 3, 8)}")

    IO.inspect(String.split(longer_string))
    IO.puts(String.reverse(longer_string))
    IO.puts(String.upcase(longer_string))
    IO.puts(String.downcase(longer_string))
    IO.puts(String.capitalize(longer_string))
  end

  def math do
    IO.puts("5 + 4 = #{5 + 4}")
    IO.puts("5 - 4 = #{5 - 4}")
    IO.puts("5 * 4 = #{5 * 4}")
    IO.puts("5 / 4 = #{5 / 4}") # return a Float
    IO.puts("5 div 4 = #{div(5, 4)}") # return an Int
    IO.puts("5 / 4 = #{rem(5, 4)}") # return the Modulo
  end

  def pipe_operator do
    4 * 10 |> IO.puts
  end

  def comparators do
    IO.puts("4 == 4.0 : #{4 == 4.0}")
    IO.puts("4 === 4.0 : #{4 === 4.0}")
    IO.puts("4 != 4.0 : #{4 != 4.0}")
    IO.puts("4 !== 4.0 : #{4 !== 4.0}")
    IO.puts("5 > 4 : #{5 > 4}")
    IO.puts("5 >= 4 : #{5 >= 4}")
    IO.puts("5 < 4 : #{5 < 4}")
    IO.puts("5 <= 4 : #{5 <= 4}")
  end

  def logical_operators(age) do
    IO.puts("Vote and Drive : #{(age >= 16) and (age >= 18)}")
    IO.puts("Vote or Drive : #{(age >= 16) or (age >= 18)}")

    IO.puts(not true)
  end

  def conditional(age) do
    if age >= 18 do
      IO.puts("Can Vote")
    else
      IO.puts("Can't Vote")
    end

    unless age === 18 do
      IO.puts("You are not 18 !")
    else
      IO.puts("You are 18 !")
    end

    cond do
      age >= 18 -> IO.puts("You can vote")
      age >= 16 -> IO.puts("You can drive")
      age >= 14 -> IO.puts("You can wait")
      true -> IO.puts("Default")
    end

    case age do
      14 -> IO.puts("You can wait")
      16 -> IO.puts("You can drive")
      18 -> IO.puts("You can vote")
      _ -> IO.puts("Default")
    end

    IO.puts("Ternary : #{if age >= 18, do: "Can vote", else: "Can't vote"}")
  end

  def tuples do
    IO.inspect(Tuple.duplicate(0, 5)) # build a {0, 0, 0, 0, 0} Tuple
    me = {175, 6.25, :Stéphane}
    me_full = Tuple.append(me, 27) # add 27 to the end of the Tuple
    IO.inspect(me_full)
    IO.puts("Age #{elem(me_full, 3)}") # return the element at index 3
    IO.puts("Size : #{tuple_size(me_full)}")
    me_altered = Tuple.delete_at(me_full, 1) # delete the elemen at index 1
    IO.inspect(me_altered)
    me_full_again = Tuple.insert_at(me_altered, 1, 1989) # insert 1989 at index 1
    IO.inspect(me_full_again)
    {height, birth_year, name, age} = me_full_again # assign variables to indexes of the `me_full_again` Tuple
    IO.puts("My birth year : #{birth_year}") # return the value of `birth_year` in the `me_full_again` Tuple
  end

  def lists do
    first_list = [1, 2, 3]
    second_list = first_list ++ [4, 5, 6] # concatenate the two Lists
    third_list = second_list -- first_list # substract what is in `first_list` from `second_list`
    IO.puts(6 in third_list) # check if `third_list` contains 6
    [head | tail] = second_list # assing the first value (index 0) of `second_list` list to the `head` variable and the rest to the `tail` variable
    IO.puts("Head : #{head}")
    IO.write("Tail : ")
    IO.inspect(tail)
    IO.inspect([97, 98, 99]) # will puts 'abc'
    IO.inspect([97, 98, 99], charlists: :as_list) # will puts [97, 98, 99] but will still return 'abc'
    Enum.each tail, fn item ->
      if item === 6, do: IO.puts(item), else: IO.write("#{item} ")
    end

    words = ["Random", "Words", "in a", "list"]
    display_words(words)
    IO.puts("-------------")
    display_words(List.delete(words, "Random")) # delete the String "Random" from the `words` List
    IO.puts("-------------")
    display_words(List.delete_at(words, 1)) # delete the element at index 1 from the `words` List
    IO.puts("-------------")
    display_words(List.insert_at(words, 1, "toto")) # insert the "toto" String in the `words` List at index 4
    IO.puts("First : #{List.first(words)}") # return the first element of the `words` List
    IO.puts("Last : #{List.last(words)}") # return the last element of the `words` List
    le_wagon = [name: "Le Wagon", city: "Bordeaux", students: 12]
  end

  defp display_words([word|words]) do
    cond do # will puts or write the Head of the List
      word == "list" -> IO.puts(word)
      true -> IO.write("#{word} ")
    end
    display_words(words) # calls itselt with the Tail of the list
  end

  defp display_words([]), do: nil # is called if there is an empty List as parameter and breaks the recursion, return nil

  def maps do
    le_wagon_bordeaux = %{
      "name" => "Le Wagon",
      "city" => "Bordeaux",
      "address" => "107 cours Balguerie Struttenberg"
    } |> IO.inspect
    IO.puts("School name : #{le_wagon_bordeaux["name"]}")

    le_wagon_paris = %{
      name: "Le Wagon",
      city: "Paris",
      address: "16 Villa Gaudelet"
    } |> IO.inspect
    IO.puts("School city : #{le_wagon_paris.city}")

    le_wagon_bordeaux_full = Map.put_new(le_wagon_bordeaux, :"zip_code", 33300) # add the key/value pair `"zip_code": 33300` to the `le_wagon_bordeaux` Map
  end

  def pattern_matching do
    [width, height] = [1920, 1080] # assign `1920` to `width` and `1080` to `height`
    IO.puts("Width : #{width}")

    [_, [_, a]] = ["1080p", [1920, 1080]] # `_` means we don't use the variable
    IO.puts("1080p height : #{a}")
  end

  def annonimous_functions do
    get_sum = fn (x, y) -> x + y end
    IO.puts("5 + 5 = #{get_sum.(5, 5)}")

    get_less = &(&1 - &2) # is equal to `fn (x, y) -> x - y end`
    IO.puts("7 - 6 = #{get_less.(7, 6)}")

    add_sum = fn # conditional functions
      {x, y} -> IO.puts("#{x} + #{y} = #{x + y}")
      {x, y, z} -> IO.puts("#{x} + #{y} + #{z} = #{x + y + z}")
    end
    add_sum.(1, 2)
    add_sum.(1, 2, 3)

    IO.puts(do_it())
  end

  defp do_it(x \\ 1, y \\ 1) do # `\\` sets the default value of a parameter
    x + y
  end

  def recursion do
    IO.puts("Factorial of 4 : #{factorial(4)}")
  end

  defp factorial(num) do
    if num <= 1 do
      1                         # 1st pass : 4 * factorial(3) = 4 * 6 = 24
    else                        # 2nd pass : 3 * factorial(2) = 3 * 2 = 6
      num * factorial(num - 1)  # 3rd pass : 2 * factorial(1) = 2 * 1 = 2
    end
  end

  # this is the same as above
  #
  # def factorial(num) when num > 1 do
  #   num * factorial(num - 1)
  # end
  #
  # def factorial(num) when num <= 1 do
  #   1
  # end

  def loops do
    IO.puts("Sum : #{sum([1, 2, 3])}") # will puts the sum of `1 + 2 + 3`

    loop(5, 1) # will puts all the numbers from 5 to 1
  end

  defp sum([]), do: 0
  defp sum([h|t]), do: h + sum(t)

  defp loop(0, _), do: nil
  defp loop(max, min) do
    if max < min do
      loop(0, min)
    else
      IO.puts("Num : #{max}")
      loop(max - 1, min)
    end
  end

  def enumerables do
    IO.puts("Even List : #{
      Enum.all?([1, 2, 3],
      fn(n) -> rem(n, 2) == 0 end
    )}") # check is the List contains only even numbers
    IO.puts("Even in the List : #{
      Enum.any?([1, 2, 3],
      fn(n) -> rem(n, 2) == 0 end
    )}") # check if the List have any even numbers

    Enum.each([1, 2, 3], fn(n) -> IO.puts(n) end) # will puts each values of the List

    IO.inspect(Enum.map([1, 2, 3], fn(n) -> n * 2 end)) # will multiply each value of the List by 2

    sum_vals = Enum.reduce([1, 2, 3], fn(n, sum) -> n + sum end)
    IO.puts("Sum: #{sum_vals}")

    IO.inspect(Enum.uniq([1, 2, 2]))
  end

  def list_comprehension do
    IO.inspect(for n <- [1, 2, 3], do: n * 2)
    IO.inspect(for n <- [1, 2, 3, 4], rem(n,2) == 0, do: n)
  end

  def exception_handling do
    err = try do
      5 / 0
    rescue
      ArithmeticError -> "Can't Divide by 0"
    end

    IO.puts(err)
  end

  def concurrency do
    spawn(fn -> loop(50, 1) end)
    spawn(fn -> loop(100, 50) end)

    send(self(), {:french, "Stéphane"})

    receive do
      {:german, name} -> IO.puts("Guten tag #{name}")
      {:french, name} -> IO.puts("Bonjour #{name}")
      {:english, name} -> IO.puts("Hello #{name}")
    after
      500 -> IO.puts("Time up")
    end
  end
end
