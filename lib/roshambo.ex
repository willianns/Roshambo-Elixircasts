defmodule Roshambo do

  def main([]) do
   IO.puts("Por favor informe um dos valores 'pedra', 'papel', ou 'tesoura'")
  end

  def main(argv) do
    argv
    |> parse_args
    |> determine_winner
    |> IO.puts
  end

  defp parse_args(argv) do 
    switches = [pedra: :boolean, papel: :boolean, tesoura: :boolean]
    parse = OptionParser.parse(argv, switches: switches)

    case parse do
      {[{ switch, true }], [player_move], _} -> 
        {to_string(switch), player_move}
      {_, [player_move], _} ->
        {get_comp_move(), player_move}
    end
  end

  defp get_comp_move do
    Enum.random(["pedra", "papel", "tesoura"])
  end

  defp determine_winner({ "papel", "pedra" }) do
    "Você perdeu, o computador tirou papel"
  end

  defp determine_winner({ "pedra", "tesoura" }) do
    "Você perdeu, o computador tirou pedra"
  end

  defp determine_winner({ "tesoura", "papel" }) do
    "Você perdeu, o computador tirou tesoura"
  end

  defp determine_winner({ comp_move, player_move }) when comp_move == player_move do
    "Empatou - vocês dois tiraram #{comp_move}"
  end

  defp determine_winner({ comp_move, _ }) do
    "Você ganhou! Computador tirou #{comp_move}"
  end
end
