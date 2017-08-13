#!/usr/bin/python3

import os
import sys
import subprocess
import time

#writes into
#/opt/data/out/PH08/changes.txt
cmd = '/opt/bin/etd.py'
arg = ['-c', '/opt/etc/etd.conf', '-o', '/opt/data/out', '--write-sync-entries']
if os.environ.get ('DUMP_COMMAND', '') :
    cmds = os.environ ['DUMP_COMMAND'].split (' ')
    cmd  = cmds [0]
    arg  = cmds [1:]
if len (sys.argv) > 1 :
    cmd = sys.argv [1]
    arg = sys.argv [2:]
arg0 = os.path.basename (cmd)
subprocess.call([cmd] + arg)
print ("finishing: sleeping")
while True:
    time.sleep(60)
