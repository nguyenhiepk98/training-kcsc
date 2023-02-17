# dùng ida để xem mã giả c

![bof3](bof3-ida.png)

- nhìn qua thì cũng biết chương trình bị overflow tại biến buff, nhưng không có gì đặc biệt khi không thấy "/bin/sh" để khai thác

![bof3-win](bof3-win.png)

-  ta hàm win() có chứa shell
![boff3-wwin-shell](boff3-winn.png)

- như vậy ta phải overwrite hàm win(), vì ở hàm main() nó không được gọi

# GDB
![gdb](ret-gdb.png)

- sau khi chạy hết thì thấy địa chỉ hàm win()

# payload

![payload](payload.png)

- chưa hiểu đoạn địa chỉ % 16 nên em làm theo video (payload += p64(0x401249 + 5))

![run](run.png)



