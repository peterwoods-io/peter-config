def add_peter_root_segment(powerline):
    if os.getenv('USER') == 'root':
        bg = Color.ROOT_INDICATOR_BG
        fg = Color.ROOT_INDICATOR_FG
        powerline.append(u' \u26a1', fg, bg)
