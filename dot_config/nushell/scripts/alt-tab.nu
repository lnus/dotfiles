export def main [] {
  let windows = niri msg -j windows
  | from json
  | sort-by is_focused -r
  | select id title app_id
  let menu = $windows
  | each {|w|
    $"($w.title) [($w.app_id)] \(($w.id)\)"
  } | str join "\n"

  let selected = ($menu  | tofi --fuzzy-match true --prompt "swap: ")
  if ($selected | is-empty) { return } # avoid error spam on esc
  let parsed = $selected | parse '{title} [{app_id}] ({id})'

  if ($parsed | is-empty) { 
    print "Invalid selection format"
    return 
  }

  niri msg action focus-window --id $parsed.0.id  
}
