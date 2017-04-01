def add_peter_hostname_segment(powerline):
    # Add hostname only when we're sshing
    if os.getenv('SSH_CLIENT'):
        if powerline.args.colorize_hostname:
            from lib.color_compliment import stringToHashToColorAndOpposite
            from lib.colortrans import rgb2short
            from socket import gethostname
            hostname = gethostname()
            FG, BG = stringToHashToColorAndOpposite(hostname)
            FG, BG = (rgb2short(*color) for color in [FG, BG])
            host_prompt = ' %s %s ' % (powerline.network, hostname.split('.')[0])

            powerline.append(host_prompt, FG, BG)
        else:
            if powerline.args.shell == 'bash':
                host_prompt = ' %s \\h ' % powerline.network
            elif powerline.args.shell == 'zsh':
                host_prompt = ' %s %%m ' % powerline.network
            else:
                import socket
                host_prompt = ' %s %s ' % (powerline.network, socket.gethostname().split('.')[0])

            powerline.append(host_prompt, Color.HOSTNAME_FG, Color.HOSTNAME_BG)
