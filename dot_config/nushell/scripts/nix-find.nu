export def main [term: string] {
  nix search --json nixpkgs $term
  | from json
  | transpose attr info
  | each { |row|
    let parts = ($row.attr | split row '.')
    $row.info | insert attr_set $parts.0 | insert platform $parts.1
  } | select pname version description attr_set platform
}
 
