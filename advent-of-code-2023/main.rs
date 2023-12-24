use std::io::{self, BufRead, Write};
use nom::{
  IResult, Parser,
  branch::alt,
  multi::separated_list1,
  combinator::{map_res,flat_map, success,value,eof},
  sequence::{delimited,preceded, terminated},
  character::complete::{i32,space0,line_ending},
  bytes::complete::tag,
  error::{Error, ParseError}
};

fn ws<'a, O, E: ParseError<&'a str>, F: Parser<&'a str, O, E>>(f: F) -> impl Parser<&'a str, O,  E> {
  delimited(space0, f, space0)
}

fn shows(i: &str) -> IResult<&str, Vec<Vec<i32>>> {
    let red = map_res(terminated(i32::<&str,Error<_>>, tag(" red")), |i| if i>12 { Err("red") } else { Ok(i)});
    let green = map_res(terminated(i32::<&str,Error<_>>, tag(" green")), |i| if i>13 { Err("green") } else { Ok(i)});
    let blue =  map_res(terminated(i32::<&str,Error<_>>, tag(" blue" )), |i| if i>14 { Err("blue" ) } else { Ok(i)});
    let show = separated_list1(ws(tag(",")),alt((red, green, blue)));
    return terminated(separated_list1(ws(tag(";")), show),alt((line_ending,eof)))(i);
}


fn game_tag(i: &str) -> IResult<&str, i32> {
  return preceded(tag("Game "), terminated(i32::<&str,Error<_>>, ws(tag(":"))))(i);
}

fn game(i: &str) -> IResult<&str, i32> {
  return flat_map(game_tag,|id| alt((value(id,shows), success(0))))(i);
}

fn parse_game(input: String) -> i32 { 
  return game(&input).unwrap().1;
}

#[cfg(test)]
mod tests {
    use super::*;
   #[test]
   fn game_tag_t() {
       assert_eq!(game_tag("Game 43: "), Ok(("",43)));
   }
   #[test]
   fn t() {
       assert_eq!(flat_map(tag::<&str,&str,Error<_>>("3"),|_| tag("4"))("34") ,Ok(("", "4")));
   }
   #[test]
   fn valid_game_t() {
       assert_eq!(game("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"),Ok(("", 1)));
   }
   #[test]
   fn invalid_game_t() {
       assert_eq!(game("Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red").map(|(_,i)|i),Ok(0));
   }
}

fn main() -> io::Result<()> {
  let stdout = io::stdout();
  writeln!(stdout.lock(),"{}",
      io::stdin().lock().lines()
          .map(|line| line.unwrap())
          .map(parse_game)
          .sum::<i32>()
      ).unwrap();
  Ok(())
}
