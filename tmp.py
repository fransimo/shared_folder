host = "127.0.0.1"
tn = telnetlib.Telnet(host,4000)
user="admin"
password="gratis"
tn.write("auth " + user + " " + password + "\n")


search = "IMG_0001.JPG"
tn.write("s -minsize 1048576 \"" + search + "\"\n")
s = tn.read_very_eager()
tn.write("vr\n")
s = tn.read_very_eager()
s3 = s.splitlines()


s3[180].split()

s3[189].split("urn:")


Result of search 7
218 results (-32 waiting)
 [ Num ]     Size   Avail Status                       Names                          Tags                      MD4                    
[     1] 22269088     1        IMG_0001.jpg                                                urn:ed2k:D36A3977BBD2D611115FA318BCA4D82C
[     2] 20908075     1        IMG_0001.jpg                                       1        urn:ed2k:13BFDC79FF47980305E61D69022186E9
[     3] 18316126     2        IMG_0001.jpg                                       1        urn:ed2k:9EC2CA819591FE46238B4DFB170B914A
