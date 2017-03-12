def add_peter_exit_code_segment(powerline):
    if powerline.args.prev_error == 0:
        return
    fg = Color.CMD_FAILED_FG
    bg = Color.CMD_FAILED_BG
    powerline.append(u' \u2718', fg, bg, "")
