#!/usr/bin/python
import sys
import argparse
import telnetlib
import time

def tn_wait(tn):
  s="1"
  time.sleep(1)
  while s <> '':
    s = tn.read_very_eager()
    print s

def search(frm=1,host="localhost",user="",password=""):
  tn = telnetlib.Telnet(host,4000)
  tn.read_until(">")
  tn.write("auth " + user + " " + password + "\n")
  tn_wait(tn)

  for j in range(frm,9999):
    search = "IMG_%04d.JPG" % j
    print "to search: " + search
    tn.write("s \"" + search + "\"\n")
    tn_wait(tn)
    print "sleep 30"
    time.sleep(5)
    print "xs"
    tn.write("xs\n")
    tn_wait(tn)
    print "sleep 55"
    time.sleep(55)
    print "vr"
    tn.write("vr\n")
    tn_wait(tn)
    for i in range(1, 6):
      d = "d %d\n" % i
      tn.write(d)
      tn_wait(tn)
      time.sleep(1)
	  
def main(argv):
  parser = argparse.ArgumentParser(description='e2k sequential search')
  parser.add_argument('--server', default="localhost", nargs='?', help='mldonkey ip server address')
  parser.add_argument('--user', default="", nargs='?', help='username')
  parser.add_argument('--password', default="", nargs='?', help='password')
  parser.add_argument('--init', type=int, default=1, nargs='?', help='sequence init')
  args = parser.parse_args()	
  search(args.init,args.server,args.user,args.password)

  
if __name__ == "__main__":
   main(sys.argv[1:])
#
