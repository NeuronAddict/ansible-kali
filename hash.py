import random,string,crypt,getpass;

randomsalt = ''.join(random.sample(string.ascii_letters,8))

password = getpass.getpass("Enter password: ")

print(crypt.crypt(password, f'$6${randomsalt}'))
