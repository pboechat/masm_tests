                        includelib          kernel32.lib
                        includelib          subr.lib
open_handle             proto
write_string            proto
write_char              proto
write_string_binary     proto
ExitProcess             proto
GetStdHandle            proto
ReadConsoleA            proto
keyboard                equ                 -11
max_buffer              equ                 20
print_string            macro               msg
                        lea                 RCX,msg
                        mov                 RDX,lengthof msg
                        call                write_string
                        endm
                        .code
main                    proc
                        sub                 RSP,40
                        
                        call                open_handle
                        mov                 RCX,keyboard
                        call                GetStdHandle
                        mov                 stdin,RAX
                        
next_iter:              print_string        start_msg
;                         mov                 RCX,stdin
;                         lea                 RDX,key_msg
;                         mov                 R8,max_buffer
;                         lea                 R9,num_bytes_read
;                         call                ReadConsoleA
;                         
;                         lea                 R12,key_msg
;                         mov                 R13,num_bytes_read
;                         
; in_loop:                mov                 RCX,R12
;                         call                write_char
;                         print_string        new_line
;                         inc                 R12
;                         dec                 R13
;                         jg                  in_loop
;                         
;                         mov                 R8,num_bytes_read
;                         cmp                 R8,2
;                         jg                  next_iter
;                         
;                         add                 RSP,40
;                         mov                 RCX,0
;                         call                ExitProcess
main                    endp
                        .data
stdin                   qword               ?
num_bytes_read          qword               ?
char                    qword                ?
start_msg               byte                "Please enter text message: "
key_msg                 byte                max_buffer DUP(?)
new_line                byte                0DH,0AH
                        end