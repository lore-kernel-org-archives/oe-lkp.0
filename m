Content-Type: multipart/mixed; boundary="===============5294806661386867294=="
MIME-Version: 1.0
From: Hao, Shun <shun.hao@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [printk] c162d5b433: BUG:KASAN:use-after-scope_in_c
Date: Fri, 02 Mar 2018 03:48:40 +0000
Message-ID: <1519962555.10510.1.camel@intel.com>
In-Reply-To: <CACT4Y+ZuCq+yN3YwusmHuv1CN86CfEYEhaJGoaD7xLG9irgyYw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5294806661386867294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

sorry for missing the attached script in original mail, here to add it.

On Thu, 2018-03-01 at 08:47 +0000, Dmitry Vyukov wrote:
> On Thu, Mar 1, 2018 at 2:37 AM, Sergey Senozhatsky
> <sergey.senozhatsky@gmail.com> wrote:
> > Hello,
> > =

> > Cc-ing Dmitry Vyukov and kasan-dev on this.
> > =

> > On (02/28/18 16:59), Petr Mladek wrote:
> > [..]
> > > > > =

> > > > > [=C2=A0=C2=A0=C2=A0=C2=A00.003333] BUG: KASAN: use-after-scope in
> > > > > console_unlock+0x185/0x960
> > > > > [=C2=A0=C2=A0=C2=A0=C2=A00.003333] BUG: KASAN: use-after-scope in
> > > > > console_unlock+0x185/0x960
> > > > =

> > > > Is there any change to get disassembly of console_unlock() from
> > > > the
> > > > problematic build?
> > > > =

> > > > I have troubles to reproduce this myself. Also I was not able
> > > > to find any
> > > > bug just by looking into the code yet. The disassembly might
> > > > help
> > > > a lot here.
> > > > =

> > > > =

> > > > Interesting symptoms (for myself and other debuggers):
> > > > =

> > > > The lines are duplicated. Therefore it happened when real
> > > > console was registered and before the early console was
> > > > unregistered.
> > > > See also the full dmesg for these actions. The related printk
> > > > messages
> > > > are right after the KASAN report.
> > > > =

> > > > I wonder if it is unsafe to pass the console_lock via
> > > > console_trylock_spinnning() from console_unlock() called
> > > > in register_console(). I do not see any problem but I might
> > > > be blind.
> > =

> > I'm not sure it we actually have concurrent printks at that state
> > yet,
> > might be too early for any printk offloading. The backtrace still
> > makes no sense to me at all, tho. We had this report twice,
> > probably,
> > already (even before the offloading patchset, if I'm not mistaken).
> > =

> > https://marc.info/?l=3Dlinux-kernel&m=3D151200883525299
> > =

> > [..]
> > > I feel lost a bit.
> > =

> > Yeah... can't understand what's going on there.
> > =

> > The last time kasan didn't like this part
> > =

> > [=C2=A0=C2=A0=C2=A0=C2=A00.003333]=C2=A0=C2=A0? console_unlock+0x605/0x=
cc0:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0atomic_read at
> > arch/x86/include/asm/atomic.h:27
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(inlined by) static_key_count at
> > include/linux/jump_label.h:191
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(inlined by) static_key_false at
> > include/linux/jump_label.h:201
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(inlined by) trace_console_rcuidle
> > at include/trace/events/printk.h:10
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(inlined by) call_console_drivers=
 at
> > kernel/printk/printk.c:1556
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(inlined by) console_unlock at
> > kernel/printk/printk.c:2233
> > =

> > complaining that there was a write of size 4... at atomic_read().
> > =

> > Now it's reporting that the write of size 1 was out of scope.
> > =

> > > I am really curious what code is proceed on the line
> > > console_unlock+0x185/0x960.
> > =

> > Agreed.
> > =

> > On my system 0x185/0x960 is somewhere around
> > =

> > =

> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0191e:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A089 d7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mov=C2=A0=C2=A0=C2=A0=C2=
=A0%edx,%edi
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A01920:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0e8 06 e7 ff ff=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0callq=C2=A0=C2=A02b <log_next>
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A01925:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A048 89 2d 00 00 00
> > 00=C2=A0=C2=A0=C2=A0=C2=A0mov=C2=A0=C2=A0=C2=A0=C2=A0%rbp,0x0(%rip)=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# 192c <console_unlock+0x17f>
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0192c:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A089 05 00 00 00
> > 00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mov=C2=A0=C2=A0=C2=A0=C2=A0=
%eax,0x0(%rip)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# 1932 <conso=
le_unlock+0x185>
> > > > =C2=A0 1932:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0eb a9=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0jmp=C2=A0=C2=A0=C2=A0=C2=A018dd
> > > > <console_unlock+0x130>
> > =

> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A01934:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A08b 35 00 00 00
> > 00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mov=C2=A0=C2=A0=C2=A0=C2=A0=
0x0(%rip),%esi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# 193a <conso=
le_unlock+0x18d>
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0193a:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0b9 00 04 00 00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0mov=C2=A0=C2=A0=C2=A0=C2=A0$0x400,%ecx
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0193f:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A04c 89 ef=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mov=C2=A0=C2=A0=C2=A0=C2=A0%r13,%rdi
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A01942:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A031 ed=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xor=C2=A0=C2=A0=C2=A0=C2=
=A0%ebp,%ebp
> > =

> > =

> > That jmp 18dd after log_next() is a `goto skip' in
> > suppress_message_printing() branch
> > =

> > skip:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (console_seq =3D=3D log_next_seq)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
break;
> > =

> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0msg =3D log_from_idx(console_idx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (suppress_message_printing(msg->level)) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
/*
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0* Skip record we have buffered and already
> > printed
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0* directly to the console when we received
> > it, and
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0* record that has level above the console
> > loglevel.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0*/
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
console_idx =3D log_next(console_idx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
console_seq++;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto skip;
> > =

> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > =

> > =

> > As far as I can tell.
> =

> =

> Hi Shun,
> =

> The report says "job-script is attached in this email", but I don't
> see it attached. Did you forget to attach it? How can I reproduce
> this
> exact build?
> Could you post a symbolized report with inlines frames?

--===============5294806661386867294==
Content-Type: application/x-shellscript
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job-script.bin"

IyEvYmluL3NoDQoNCmV4cG9ydF90b3BfZW52KCkNCnsNCglleHBvcnQgc3VpdGU9J2Jvb3QnDQoJ
ZXhwb3J0IHRlc3RjYXNlPSdib290Jw0KCWV4cG9ydCB0aW1lb3V0PScxMG0nDQoJZXhwb3J0IGpv
Yl9vcmlnaW49Jy9sa3AvbGtwL3NyYy9qb2JzL2Jvb3QueWFtbCcNCglleHBvcnQgcXVldWU9J2Jp
c2VjdCcNCglleHBvcnQgdGVzdGJveD0ndm0tbGtwLW5leDA0LTFHLTI1Jw0KCWV4cG9ydCB0Ym94
X2dyb3VwPSd2bS1sa3AtbmV4MDQtMUcnDQoJZXhwb3J0IGJyYW5jaD0nbGludXgtZGV2ZWwvZGV2
ZWwtaG91cmx5LTIwMTgwMjAzMjInDQoJZXhwb3J0IGNvbW1pdD0nYzE2MmQ1YjQzMzhkNzJkZWVk
NjFhYTY1ZWQwZjJmNGJhMmJiYzhhYicNCglleHBvcnQga2NvbmZpZz0neDg2XzY0LXJhbmRjb25m
aWctdjAtMDIwNDAyNTknDQoJZXhwb3J0IHN1Ym1pdF9pZD0nNWE4MDAzYjIwYjlhOTM0MTcyYjhj
MzliJw0KCWV4cG9ydCBqb2JfZmlsZT0nL2xrcC9zY2hlZHVsZWQvdm0tbGtwLW5leDA0LTFHLTI1
L2Jvb3QtMS1kZWJpYW4teDg2XzY0LTIwMTYtMDgtMzEuY2d6LWMxNjJkNWI0MzM4ZDcyZGVlZDYx
YWE2NWVkMGYyZjRiYTJiYmM4YWItMjAxODAyMTEtODIyOTAtZmMwdzRqLTAueWFtbCcNCglleHBv
cnQgaWQ9J2ZkNWY1YjA3MGJiZDk0ODFkOWNlYjcxMDIxNDhhNzcyMTAxNDUyNDcnDQoJZXhwb3J0
IG1vZGVsPSdxZW11LXN5c3RlbS14ODZfNjQgLWVuYWJsZS1rdm0gLWNwdSBob3N0Jw0KCWV4cG9y
dCBucl92bT0zMA0KCWV4cG9ydCBucl9jcHU9Mg0KCWV4cG9ydCBtZW1vcnk9JzFHJw0KCWV4cG9y
dCBuZWVkX2tjb25maWc9J0NPTkZJR19LVk1fR1VFU1Q9eScNCglleHBvcnQgc3NoX2Jhc2VfcG9y
dD0yMzIwMA0KCWV4cG9ydCBjb21waWxlcj0nZ2NjLTcnDQoJZXhwb3J0IHJvb3Rmcz0nZGViaWFu
LXg4Nl82NC0yMDE2LTA4LTMxLmNneicNCglleHBvcnQgZW5xdWV1ZV90aW1lPScyMDE4LTAyLTEx
IDE2OjQ5OjU0ICswODAwJw0KCWV4cG9ydCBfaWQ9JzVhODAwM2IyMGI5YTkzNDE3MmI4YzM5YicN
CglleHBvcnQgX3J0PScvcmVzdWx0L2Jvb3QvMS92bS1sa3AtbmV4MDQtMUcvZGViaWFuLXg4Nl82
NC0yMDE2LTA4LTMxLmNnei94ODZfNjQtcmFuZGNvbmZpZy12MC0wMjA0MDI1OS9nY2MtNy9jMTYy
ZDViNDMzOGQ3MmRlZWQ2MWFhNjVlZDBmMmY0YmEyYmJjOGFiJw0KCWV4cG9ydCB1c2VyPSdsa3An
DQoJZXhwb3J0IHJlc3VsdF9yb290PScvcmVzdWx0L2Jvb3QvMS92bS1sa3AtbmV4MDQtMUcvZGVi
aWFuLXg4Nl82NC0yMDE2LTA4LTMxLmNnei94ODZfNjQtcmFuZGNvbmZpZy12MC0wMjA0MDI1OS9n
Y2MtNy9jMTYyZDViNDMzOGQ3MmRlZWQ2MWFhNjVlZDBmMmY0YmEyYmJjOGFiLzAnDQoJZXhwb3J0
IExLUF9TRVJWRVI9J2lubicNCglleHBvcnQgbWF4X3VwdGltZT02MDANCglleHBvcnQgaW5pdHJk
PScvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE2LTA4LTMxLmNneicNCglleHBvcnQg
Ym9vdGxvYWRlcl9hcHBlbmQ9J3Jvb3Q9L2Rldi9yYW0wDQp1c2VyPWxrcA0Kam9iPS9sa3Avc2No
ZWR1bGVkL3ZtLWxrcC1uZXgwNC0xRy0yNS9ib290LTEtZGViaWFuLXg4Nl82NC0yMDE2LTA4LTMx
LmNnei1jMTYyZDViNDMzOGQ3MmRlZWQ2MWFhNjVlZDBmMmY0YmEyYmJjOGFiLTIwMTgwMjExLTgy
MjkwLWZjMHc0ai0wLnlhbWwNCkFSQ0g9eDg2XzY0DQprY29uZmlnPXg4Nl82NC1yYW5kY29uZmln
LXYwLTAyMDQwMjU5DQpicmFuY2g9bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTgwMjAzMjIN
CmNvbW1pdD1jMTYyZDViNDMzOGQ3MmRlZWQ2MWFhNjVlZDBmMmY0YmEyYmJjOGFiDQpCT09UX0lN
QUdFPS9wa2cvbGludXgveDg2XzY0LXJhbmRjb25maWctdjAtMDIwNDAyNTkvZ2NjLTcvYzE2MmQ1
YjQzMzhkNzJkZWVkNjFhYTY1ZWQwZjJmNGJhMmJiYzhhYi92bWxpbnV6LTQuMTQuMC0xMjk1My1n
YzE2MmQ1Yg0KbWF4X3VwdGltZT02MDANClJFU1VMVF9ST09UPS9yZXN1bHQvYm9vdC8xL3ZtLWxr
cC1uZXgwNC0xRy9kZWJpYW4teDg2XzY0LTIwMTYtMDgtMzEuY2d6L3g4Nl82NC1yYW5kY29uZmln
LXYwLTAyMDQwMjU5L2djYy03L2MxNjJkNWI0MzM4ZDcyZGVlZDYxYWE2NWVkMGYyZjRiYTJiYmM4
YWIvMA0KTEtQX1NFUlZFUj1pbm4NCmRlYnVnDQphcGljPWRlYnVnDQpzeXNycV9hbHdheXNfZW5h
YmxlZA0KcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMA0KbmV0LmlmbmFtZXM9MA0K
cHJpbnRrLmRldmttc2c9b24NCnBhbmljPS0xDQpzb2Z0bG9ja3VwX3BhbmljPTENCm5taV93YXRj
aGRvZz1wYW5pYw0Kb29wcz1wYW5pYw0KbG9hZF9yYW1kaXNrPTINCnByb21wdF9yYW1kaXNrPTAN
CmRyYmQubWlub3JfY291bnQ9OA0Kc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyDQppZ25vcmVfbG9nbGV2
ZWwNCmNvbnNvbGU9dHR5MA0KZWFybHlwcmludGs9dHR5UzAsMTE1MjAwDQpjb25zb2xlPXR0eVMw
LDExNTIwMA0KdmdhPW5vcm1hbA0KcncnDQoJZXhwb3J0IG1vZHVsZXNfaW5pdHJkPScvcGtnL2xp
bnV4L3g4Nl82NC1yYW5kY29uZmlnLXYwLTAyMDQwMjU5L2djYy03L2MxNjJkNWI0MzM4ZDcyZGVl
ZDYxYWE2NWVkMGYyZjRiYTJiYmM4YWIvbW9kdWxlcy5jZ3onDQoJZXhwb3J0IGJtX2luaXRyZD0n
L29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTYtMDgtMzEuY2d6L2xrcF8yMDE3LTEyLTE0
LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNi0wOC0zMS5jZ3ovcnN5bmMtcm9v
dGZzXzIwMTYtMTEtMTUuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE2LTA4LTMx
LmNnei9ydW4taXBjb25maWdfMjAxNi0xMS0xNS5jZ3onDQoJZXhwb3J0IGxrcF9pbml0cmQ9Jy9s
a3AvbGtwL2xrcC14ODZfNjQuY2d6Jw0KCWV4cG9ydCBzaXRlPSdpbm4nDQoJZXhwb3J0IExLUF9D
R0lfUE9SVD04MA0KCWV4cG9ydCBMS1BfQ0lGU19QT1JUPTEzOQ0KCWV4cG9ydCBrZXJuZWw9Jy9w
a2cvbGludXgveDg2XzY0LXJhbmRjb25maWctdjAtMDIwNDAyNTkvZ2NjLTcvYzE2MmQ1YjQzMzhk
NzJkZWVkNjFhYTY1ZWQwZjJmNGJhMmJiYzhhYi92bWxpbnV6LTQuMTQuMC0xMjk1My1nYzE2MmQ1
YicNCglleHBvcnQgZGVxdWV1ZV90aW1lPScyMDE4LTAyLTExIDE2OjUxOjA2ICswODAwJw0KCWV4
cG9ydCBqb2JfaW5pdHJkPScvbGtwL3NjaGVkdWxlZC92bS1sa3AtbmV4MDQtMUctMjUvYm9vdC0x
LWRlYmlhbi14ODZfNjQtMjAxNi0wOC0zMS5jZ3otYzE2MmQ1YjQzMzhkNzJkZWVkNjFhYTY1ZWQw
ZjJmNGJhMmJiYzhhYi0yMDE4MDIxMS04MjI5MC1mYzB3NGotMC5jZ3onDQoNCglbIC1uICIkTEtQ
X1NSQyIgXSB8fA0KCWV4cG9ydCBMS1BfU1JDPS9sa3AvJHt1c2VyOi1sa3B9L3NyYw0KfQ0KDQpy
dW5fam9iKCkNCnsNCgllY2hvICQkID4gJFRNUC9ydW4tam9iLnBpZA0KDQoJLiAkTEtQX1NSQy9s
aWIvaHR0cC5zaA0KCS4gJExLUF9TUkMvbGliL2pvYi5zaA0KCS4gJExLUF9TUkMvbGliL2Vudi5z
aA0KDQoJZXhwb3J0X3RvcF9lbnYNCg0KCXJ1bl9tb25pdG9yICRMS1BfU1JDL21vbml0b3JzL29u
ZS1zaG90L3dyYXBwZXIgYm9vdC1zbGFiaW5mbw0KCXJ1bl9tb25pdG9yICRMS1BfU1JDL21vbml0
b3JzL29uZS1zaG90L3dyYXBwZXIgYm9vdC1tZW1pbmZvDQoJcnVuX21vbml0b3IgJExLUF9TUkMv
bW9uaXRvcnMvb25lLXNob3Qvd3JhcHBlciBtZW1tYXANCglydW5fbW9uaXRvciAkTEtQX1NSQy9t
b25pdG9ycy9uby1zdGRvdXQvd3JhcHBlciBib290LXRpbWUNCglydW5fbW9uaXRvciAkTEtQX1NS
Qy9tb25pdG9ycy93cmFwcGVyIGttc2cNCglydW5fbW9uaXRvciAkTEtQX1NSQy9tb25pdG9ycy93
cmFwcGVyIG9vbS1raWxsZXINCglydW5fbW9uaXRvciAkTEtQX1NSQy9tb25pdG9ycy9wbGFpbi93
YXRjaGRvZw0KDQoJcnVuX3Rlc3QgJExLUF9TUkMvdGVzdHMvd3JhcHBlciBzbGVlcCAxDQp9DQoN
CmV4dHJhY3Rfc3RhdHMoKQ0Kew0KCSRMS1BfU1JDL3N0YXRzL3dyYXBwZXIgYm9vdC1zbGFiaW5m
bw0KCSRMS1BfU1JDL3N0YXRzL3dyYXBwZXIgYm9vdC1tZW1pbmZvDQoJJExLUF9TUkMvc3RhdHMv
d3JhcHBlciBtZW1tYXANCgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIGJvb3QtbWVtb3J5DQoJJExL
UF9TUkMvc3RhdHMvd3JhcHBlciBib290LXRpbWUNCgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIGtl
cm5lbC1zaXplDQoJJExLUF9TUkMvc3RhdHMvd3JhcHBlciBrbXNnDQoNCgkkTEtQX1NSQy9zdGF0
cy93cmFwcGVyIHRpbWUgc2xlZXAudGltZQ0KCSRMS1BfU1JDL3N0YXRzL3dyYXBwZXIgdGltZQ0K
CSRMS1BfU1JDL3N0YXRzL3dyYXBwZXIgZG1lc2cNCgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIGtt
c2cNCgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIHN0ZGVycg0KCSRMS1BfU1JDL3N0YXRzL3dyYXBw
ZXIgbGFzdF9zdGF0ZQ0KfQ0KDQoiJEAiDQo=

--===============5294806661386867294==--

