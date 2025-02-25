function scd
  set -l tags $argv[1]
  if test -z "$tags"
    set tags proj
  end

  set -l dir (stag s $tags --dirs | fzf)

  if test -n "$dir"
    cd "$dir"
  end
end
