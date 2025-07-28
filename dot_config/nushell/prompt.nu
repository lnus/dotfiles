# inspo
# https://github.com/RGBCube/ncc/blob/86f136d9fd7cc2f3b736124a514e0a3043dad967/modules/common/shell/0_nushell.nu#L157# 
 
do --env {
  def prompt-header [
    --left-char: string
  ]: nothing -> string {
    let code = $env.LAST_EXIT_CODE

    let hostname = if ($env.SSH_CONNECTION? | is-not-empty) {
      let hostname = try {
        hostname
      } catch {
        "remote"
      }

      $"(ansi light_green_bold)@($hostname)(ansi reset) "
    } else {
      ""
    }

    let pwd = pwd | path expand
    let pwd = if ($pwd | str starts-with $env.HOME) {
      "~" | path join ($pwd | path relative-to $env.HOME)
    } else {
      $pwd
    }

    let body = $"($hostname)(ansi cyan)($pwd)(ansi reset)"

    let command_duration = ($env.CMD_DURATION_MS | into int) * 1ms
    let command_duration = if $command_duration <= 2sec {
      ""
    } else {
      $"┫(ansi light_magenta_bold)($command_duration)(ansi light_yellow_bold)┣━"
    }

    let exit_code = if $code == 0 {
      ""
    } else {
      $"┫(ansi light_red_bold)($code)(ansi light_yellow_bold)┣━"
    }

    let middle = if $command_duration == "" and $exit_code == "" {
      "━"
    } else {
      ""
    }

    $"(ansi light_yellow_bold)($left_char)($exit_code)($middle)($command_duration)(ansi reset) ($body)(char newline)"
  }

  $env.PROMPT_INDICATOR = $"(ansi light_yellow_bold)┃(ansi reset) "
  $env.PROMPT_INDICATOR_VI_NORMAL = $env.PROMPT_INDICATOR
  $env.PROMPT_INDICATOR_VI_INSERT = $env.PROMPT_INDICATOR
  $env.PROMPT_MULTILINE_INDICATOR = $env.PROMPT_INDICATOR
  
  $env.PROMPT_COMMAND = {||
    prompt-header --left-char "┏"
  }
  
  $env.PROMPT_COMMAND_RIGHT = ""

  $env.TRANSIENT_PROMPT_INDICATOR = "  "
  $env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = $env.TRANSIENT_PROMPT_INDICATOR
  $env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = $env.TRANSIENT_PROMPT_INDICATOR
  $env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = $env.TRANSIENT_PROMPT_INDICATOR
  
  $env.TRANSIENT_PROMPT_COMMAND = {||
    prompt-header --left-char "━"
  }
  
  $env.TRANSIENT_PROMPT_COMMAND_RIGHT = ""
}
