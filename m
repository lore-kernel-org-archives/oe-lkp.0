Content-Type: multipart/mixed; boundary="===============4787762370510085056=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [printk] c162d5b433: BUG:KASAN:use-after-scope_in_c
Date: Thu, 01 Mar 2018 10:37:22 +0900
Message-ID: <20180301013722.GA6763@tigerII.localdomain>
In-Reply-To: <20180228155941.34z45rjz3bjqde7w@pathway.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============4787762370510085056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

Cc-ing Dmitry Vyukov and kasan-dev on this.

On (02/28/18 16:59), Petr Mladek wrote:
[..]
> > > =

> > > [    0.003333] BUG: KASAN: use-after-scope in console_unlock+0x185/0x=
960
> > > [    0.003333] BUG: KASAN: use-after-scope in console_unlock+0x185/0x=
960
> > =

> > Is there any change to get disassembly of console_unlock() from the
> > problematic build?
> > =

> > I have troubles to reproduce this myself. Also I was not able to find a=
ny
> > bug just by looking into the code yet. The disassembly might help
> > a lot here.
> > =

> > =

> > Interesting symptoms (for myself and other debuggers):
> > =

> > The lines are duplicated. Therefore it happened when real
> > console was registered and before the early console was unregistered.
> > See also the full dmesg for these actions. The related printk messages
> > are right after the KASAN report.
> > =

> > I wonder if it is unsafe to pass the console_lock via
> > console_trylock_spinnning() from console_unlock() called
> > in register_console(). I do not see any problem but I might
> > be blind.

I'm not sure it we actually have concurrent printks at that state yet,
might be too early for any printk offloading. The backtrace still
makes no sense to me at all, tho. We had this report twice, probably,
already (even before the offloading patchset, if I'm not mistaken).

https://marc.info/?l=3Dlinux-kernel&m=3D151200883525299

[..]
> I feel lost a bit.

Yeah... can't understand what's going on there.

The last time kasan didn't like this part

[    0.003333]  ? console_unlock+0x605/0xcc0:
                              atomic_read at arch/x86/include/asm/atomic.h:=
27
                               (inlined by) static_key_count at include/lin=
ux/jump_label.h:191
                               (inlined by) static_key_false at include/lin=
ux/jump_label.h:201
                               (inlined by) trace_console_rcuidle at includ=
e/trace/events/printk.h:10
                               (inlined by) call_console_drivers at kernel/=
printk/printk.c:1556
                               (inlined by) console_unlock at kernel/printk=
/printk.c:2233

complaining that there was a write of size 4... at atomic_read().

Now it's reporting that the write of size 1 was out of scope.

> I am really curious what code is proceed on the line
> console_unlock+0x185/0x960.

Agreed.

On my system 0x185/0x960 is somewhere around


     191e:       89 d7                   mov    %edx,%edi
     1920:       e8 06 e7 ff ff          callq  2b <log_next>
     1925:       48 89 2d 00 00 00 00    mov    %rbp,0x0(%rip)        # 192=
c <console_unlock+0x17f>
     192c:       89 05 00 00 00 00       mov    %eax,0x0(%rip)        # 193=
2 <console_unlock+0x185>
>>   1932:       eb a9                   jmp    18dd <console_unlock+0x130>
     1934:       8b 35 00 00 00 00       mov    0x0(%rip),%esi        # 193=
a <console_unlock+0x18d>
     193a:       b9 00 04 00 00          mov    $0x400,%ecx
     193f:       4c 89 ef                mov    %r13,%rdi
     1942:       31 ed                   xor    %ebp,%ebp


That jmp 18dd after log_next() is a `goto skip' in
suppress_message_printing() branch

skip:
                if (console_seq =3D=3D log_next_seq)
                        break;

                msg =3D log_from_idx(console_idx);
                if (suppress_message_printing(msg->level)) {
                        /*
                         * Skip record we have buffered and already printed
                         * directly to the console when we received it, and
                         * record that has level above the console loglevel.
                         */
                        console_idx =3D log_next(console_idx);
                        console_seq++;
>>                      goto skip;
                }


As far as I can tell.

	-ss

--===============4787762370510085056==--

