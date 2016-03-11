host = "127.0.0.1"
tn = telnetlib.Telnet(host,4000)
user="admin"
password="gratis"
tn.write("auth " + user + " " + password + "\n")


search = "IMG_0001.JPG"
tn.write("s \"" + search + "\"\n")
s = tn.read_very_eager()
tn.write("vr\n")
s = tn.read_very_eager()
s3 = s.splitlines()


s3[180].split()

s3[189].split("urn:")
