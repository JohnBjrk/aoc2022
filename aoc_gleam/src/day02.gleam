import gleam/string
import gleam/list.{fold, map}
import gleam/int.{add}

type Shape {
  Rock(value: Int)
  Paper(value: Int)
  Scissors(value: Int)
}

type Game {
  Game(elf: Shape, you: Shape)
}

type Strategy {
  Lose
  Draw
  Win
}

type GameStrategy {
  GameStrategy(elf: Shape, you: Strategy)
}

fn game_score(game: Game) -> Int {
  let Game(elf, you) = game
  case elf, you {
    elf, you if elf == you -> 3 + you.value
    Rock(_), Paper(a) | Paper(_), Scissors(a) | Scissors(_), Rock(a) -> 6 + a
    Rock(_), Scissors(a) | Scissors(_), Paper(a) | Paper(_), Rock(a) -> a
  }
}

fn to_game(input: String) -> Game {
  let [elf, you] = string.split(input, " ")
  Game(parse_shape(elf), parse_shape(you))
}

fn to_game_strategy(input: String) -> GameStrategy {
  let [elf, you] = string.split(input, " ")
  GameStrategy(parse_shape(elf), parse_strategy(you))
}

fn parse_shape(shape: String) -> Shape {
  case shape {
    "A" | "X" -> Rock(1)
    "B" | "Y" -> Paper(2)
    "C" | "Z" -> Scissors(3)
  }
}

fn parse_strategy(strategy: String) -> Strategy {
  case strategy {
    "X" -> Lose
    "Y" -> Draw
    "Z" -> Win
  }
}

fn strategy_to_game(game_strategy: GameStrategy) -> Game {
  let GameStrategy(elf, strategy) = game_strategy
  case strategy {
    Lose ->
      case elf {
        Rock(_) -> Game(elf, Scissors(3))
        Paper(_) -> Game(elf, Rock(1))
        Scissors(_) -> Game(elf, Paper(2))
      }
    Win ->
      case elf {
        Rock(_) -> Game(elf, Paper(2))
        Paper(_) -> Game(elf, Scissors(3))
        Scissors(_) -> Game(elf, Rock(1))
      }
    Draw -> Game(elf, elf)
  }
}

pub fn part1(puzzle: String) -> Int {
  string.split(puzzle, "\n")
  |> map(to_game)
  |> map(game_score)
  |> fold(0, add)
}

pub fn part2(puzzle: String) -> Int {
  string.split(puzzle, "\n")
  |> map(to_game_strategy)
  |> map(strategy_to_game)
  |> map(game_score)
  |> fold(0, add)
}
