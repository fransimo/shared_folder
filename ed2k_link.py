import hashlib
 
def hash_file(self, file_path):
    """ Returns the ed2k hash of a given file. """
 
    md4 = hashlib.new('md4').copy
 
    def gen(f):
        while True:
            x = f.read(9728000)
            if x: yield x
            else: return
 
    def md4_hash(data):
        m = md4()
        m.update(data)
        return m
 
    with open(file_path, 'rb') as f:
        a = gen(f)
        hashes = [md4_hash(data).digest() for data in a]
        if len(hashes) == 1:
            return hashes[0].encode("hex")
        else: return md4_hash(reduce(lambda a,d: a + d, hashes, "")).hexdigest()
