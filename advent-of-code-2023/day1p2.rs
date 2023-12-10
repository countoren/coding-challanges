use std::io::{self, BufRead, Write};

fn words(input: String) -> i32 
{
    let nums = [ ("one","1"), ("two","2"), ("three","3"), ("four","4")
    , ("five","5"), ("six","6"), ("seven","7"), ("eight","8"), ("nine","9")
    ].iter().flat_map(|(w,n)| 
       input.match_indices(w)
       .chain(input.match_indices(n)).map(move |(x,_)| (x,n.to_string()))
    ).collect::<Vec<_>>();
    return format!("{}{}", nums.iter().min().unwrap().1, nums.iter().max().unwrap().1)
        .parse::<i32>().unwrap();
}

fn main() -> io::Result<()> {
  let stdout = io::stdout();
  writeln!(stdout.lock(),"{}",
      io::stdin().lock().lines()
          .map(|line| line.unwrap())
          .map(words)
          .sum::<i32>()
      ).unwrap();

  Ok(())
}
