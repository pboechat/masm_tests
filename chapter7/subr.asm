                        includelib      kernel32.lib
WriteConsoleA           proto
GetStdHandle            proto
console                 equ             -10
                        .code
open_handle             proc
                        mov             RCX,console
                        sub             RSP,40
                        call            GetStdHandle
                        add             RSP,40
                        mov             stdout,RAX
                        ret
open_handle             endp
write_string            proc
                        mov             msg,RCX
                        mov             msg_len,RDX
                        mov             RCX,stdout
                        mov             RDX,msg
                        mov             R8,msg_len
                        lea             R9,num_bytes_written
                        sub             RSP,40
                        call            WriteConsoleA
                        add             RSP,40
                        ret
write_string            endp
write_char              proc
                        mov             RDX,1
                        call            write_string
                        ret
write_char              endp
write_string_binary     proc
                        ; TODO
                        ret
write_string_binary     endp
                        .data
msg                     qword           ?
msg_len                 qword           ?
stdout                  qword           ?
num_bytes_written       qword           ?
                        end