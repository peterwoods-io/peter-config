from ..utils import BasicSegment
from ..color_compliment import stringToHashToColorAndOpposite
from ..colortrans import rgb2short
from socket import gethostname
import os

class Segment(BasicSegment):
    def add_to_powerline(self):
        powerline = self.powerline
        # Add hostname only when we're sshing
        if os.getenv('SSH_CLIENT'):
            if powerline.segment_conf("hostname", "colorize"):
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

                powerline.append(host_prompt, powerline.theme.HOSTNAME_FG, powerline.theme.HOSTNAME_BG)
