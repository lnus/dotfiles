function e
    set -l editor $EDITOR
    if test -z "$editor"
        echo "Error: \$EDITOR not set"
        return 1
    end

    $editor $argv
end
