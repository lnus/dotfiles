function jira --description "Who needs Jira when you have bad comments and ripgrep"
    set -l todo_count (rg "TODO" --count-matches 2>/dev/null | awk -F: '{sum += $2} END {print sum}' || echo 0)
    set -l fix_count (rg "FIX" --count-matches 2>/dev/null | awk -F: '{sum += $2} END {print sum}' || echo 0)
    set -l fixme_count (rg "FIXME" --count-matches 2>/dev/null | awk -F: '{sum += $2} END {print sum}' || echo 0)
    set -l bug_count (rg "BUG" --count-matches 2>/dev/null | awk -F: '{sum += $2} END {print sum}' || echo 0)

    # Handle empty results by setting them to 0
    test -z "$todo_count" && set todo_count 0
    test -z "$fix_count" && set fix_count 0
    test -z "$fixme_count" && set fixme_count 0
    test -z "$bug_count" && set bug_count 0

    echo ""
    echo "🔍 Project Status:"
    echo "----------------"

    set_color blue
    echo "TODO:  $todo_count"

    set_color red
    echo "FIX:   $fix_count"

    set_color magenta
    echo "FIXME: $fixme_count"

    set_color yellow
    echo "BUG:   $bug_count"

    set_color normal

    set -l total (math "$todo_count + $fix_count + $fixme_count + $bug_count")
    echo "----------------"
    echo "Total: $total items"

    if test (count $argv) -gt 0; and test "$argv[1]" = "--details"
        echo ""
        echo "📋 Details:"
        echo ""

        if test $todo_count -gt 0
            set_color blue
            echo "TODOs:"
            set_color normal
            rg "TODO" --line-number --with-filename | sed 's/^/  /'
            echo ""
        end

        if test $fix_count -gt 0
            set_color red
            echo "FIXes:"
            set_color normal
            rg "FIX" --line-number --with-filename | sed 's/^/  /'
            echo ""
        end

        if test $fixme_count -gt 0
            set_color magenta
            echo "FIXMEs:"
            set_color normal
            rg "FIXME" --line-number --with-filename | sed 's/^/  /'
            echo ""
        end

        if test $bug_count -gt 0
            set_color yellow
            echo "BUGs:"
            set_color normal
            rg "BUG" --line-number --with-filename | sed 's/^/  /'
            echo ""
        end
    end

    echo ""
end
