from ..utils import BasicSegment
import os

class Segment(BasicSegment):
    def add_to_powerline(self):
        powerline = self.powerline
        if os.getenv('USER') == 'root':
            bg = Color.ROOT_INDICATOR_BG
            fg = Color.ROOT_INDICATOR_FG
            powerline.append(u' \u26a1', fg, bg)
