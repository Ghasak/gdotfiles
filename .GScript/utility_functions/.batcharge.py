#!/usr/bin/env python
# coding=UTF-8
# Source:
# https://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/#my-right-prompt-battery-capacity


import sys
import math
import subprocess

p = subprocess.Popen(["ioreg", "-rc", "AppleSmartBattery"],
                     stdout=subprocess.PIPE)
output = p.communicate()[0]


o_max = [l for l in output.splitlines() if 'MaxCapacity' in str(l)][0]
o_cur = [l for l in output.splitlines() if 'CurrentCapacity' in str(l)][0]
o_max = str(o_max)
o_cur = str(o_cur)

b_max = float(str(o_max).rpartition('=')[-1].strip().strip("'"))
b_cur = float(str(o_cur).rpartition('=')[-1].strip().strip("'"))


charge = b_cur / b_max
charge_threshold = int(math.ceil(10 * charge))


def battry_state(charge):
    '''
        - input the current battary level
        - check the current battary level with max (100%)
        - I divide (10/5=> 2 ) which means
        - mapping
        {'Empty_battry': 0,
         'quartor_battary' 1~25
         'half_battray': 25 ~ 50
         'three_quartor': 50 ~ 75
         'full_charged' : 75 ~ 100
        }
    '''
    _100_battary = '\uf578' + '   100%'
    _90_battary = '\uf581' + '   90%'
    _80_battary = '\uf580' + '   80%'
    _70_battary = '\uf57f' + '   70%'
    _60_battary = '\uf57e' + '   60%'
    _50_battary = '\uf57d' + '   50%'
    _40_battary = '\uf57c' + '   40%'
    _30_battary = '\uf57b' + '   30'
    _20_battary = '\uf57a' + '   20%'
    _10_battary = '\uf579' + '   10%'

    # _0_battary = '\uf244' + '   0%'
    # _25_battary = '\uf243' + '   25%'
    # _50_battary = '\uf242' + '   50%'
    # _75_battary = '\uf241' + '   75%'
    # _100_battary = '\uf240' + '   100%'

    if (0 < charge <= 10):
        return _10_battary
    elif (11 < charge <= 20):
        return _20_battary
    elif (21 < charge <= 30):
        return _30_battary
    elif (31 < charge <= 40):
        return _40_battary
    elif (41 < charge <= 50):
        return _50_battary
    elif (51 < charge <= 60):
        return _60_battary
    elif (61 < charge <= 70):
        return _70_battary
    elif (71 < charge <= 80):
        return _80_battary
    elif (81 < charge <= 90):
        return _90_battary
    elif (91 < charge <= 100):
        return _100_battary


current_battary_icon = battry_state(
    charge=int(100 * charge))
TOTAL = current_battary_icon
out = str(TOTAL)
# t = str(out, 'utf-8')
sys.stdout.write(out)
