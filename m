Content-Type: multipart/mixed; boundary="===============0532004897817440079=="
MIME-Version: 1.0
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: lkp@lists.01.org
Subject: Re: [srcu] a365bb5f6e: leaking_addresses.proc.___srcu_struct_ptrs.
Date: Mon, 08 Apr 2019 13:06:56 -0400
Message-ID: <118257214.1376.1554743216233.JavaMail.zimbra@efficios.com>
In-Reply-To: <20190408152112.GM14111@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0532004897817440079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

----- On Apr 8, 2019, at 11:21 AM, paulmck paulmck(a)linux.ibm.com wrote:

> On Mon, Apr 08, 2019 at 10:57:50PM +0800, Rong Chen wrote:
>> On Mon, Apr 08, 2019 at 07:30:37AM -0700, Paul E. McKenney wrote:
>> > On Mon, Apr 08, 2019 at 09:56:10PM +0800, kernel test robot wrote:
>> > > FYI, we noticed the following commit (built with gcc-7):
>> > > =

>> > > commit: a365bb5f6eafb220a1448674054b05c250829313 ("srcu: Allocate pe=
r-CPU data
>> > > for DEFINE_SRCU() in modules")
>> > > https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git
>> > > tmp.2019.04.07a
>> > > =

>> > > in testcase: leaking_addresses
>> > > with following parameters:
>> > > =

>> > > =

>> > > =

>> > > =

>> > > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -sm=
p 2 -m 2G
>> > > =

>> > > caused below changes (please refer to attached dmesg/kmsg for entire
>> > > log/backtrace):
>> > > =

>> > > =

>> > > +-------------------------------------------------+------------+----=
--------+
>> > > |                                                 | a44a55abae | a36=
5bb5f6e |
>> > > +-------------------------------------------------+------------+----=
--------+
>> > > | boot_successes                                  | 0          | 3  =
        |
>> > > | boot_failures                                   | 4          | 6  =
        |
>> > > | BUG:kernel_reboot-without-warning_in_test_stage | 4          | 6  =
        |
>> > > | leaking_addresses.proc.___srcu_struct_ptrs.     | 0          | 6  =
        |
>> > > +-------------------------------------------------+------------+----=
--------+
>> > =

>> > Please help me out here.  Without this commit, the kernel never succee=
ds
>> > in booting, but with it the kernel sometimes succeeds in booting?  Or =
am
>> > I misinterpreting the above table?
>> > =

>> > 							Thanx, Paul
>> =

>> Hi Paul,
>> =

>> The message "kernel_reboot-without-warning_in_test_stage" is from 0day,
>> leaking addresses generated many dmesgs, so 0day thought some bootings m=
ay
>> failed.
> =

[...]
>> > =

>> > > [1 .rodata.cst16.POLY] 0xffffffffc0498360
>> > > [1 .rodata.cst32.byteshift_table] 0xffffffffc03f50f0
>> > > [19 __bug_table] 0xffffffffc02be184
>> > > [2 __tracepoints_ptrs] 0xffffffffc02f1cd0
>> > > [15 .smp_locks] 0xffffffffc042b2cc
>> > > [1 .rodata.cst16.enc] 0xffffffffc0498420
>> > > [11 __ksymtab_gpl] 0xffffffffc042b028
>> > > [8 __ex_table] 0xffffffffc04f13f4
>> > > [1 .init.rodata] 0xffffffffc0316000
>> > > [36 .note.gnu.build-id] 0xffffffffc03ed000
>> > > [1 .rodata.cst16.dec] 0xffffffffc0498410
>> > > [16 .parainstructions] 0xffffffffc03ed940
>> > > [8 .text..refcount] 0xffffffffc04e2aaa
>> > > [36 .gnu.linkonce.this_module] 0xffffffffc03f12c0
>> > > [2 __bpf_raw_tp_map] 0xffffffffc03054a0
>> > > [30 .orc_unwind_ip] 0xffffffffc03ee9f9
>> > > [8 .altinstr_replacement] 0xffffffffc0497372
>> > > [26 .rodata.str1.8] 0xffffffffc03ed1f0
>> > > [11 __verbose] 0xffffffffc05c9398
>> > > [1 .rodata.cst16.TWOONE] 0xffffffffc0498380
>> > > [1 uevent] KEY=3D402000000 3803078f800d001 feffffdfffefffff ffffffff=
fffffffe
>> > > [1 .rodata.cst16.ONE] 0xffffffffc04983e0
>> > > [8 .altinstructions] 0xffffffffc0498430
>> > > [36 modules] crct10dif_pclmul 16384 1 - Live 0xffffffffc03f4000
>> > > [1 ___srcu_struct_ptrs] 0xffffffffc03840d0
>> > > =


This list of "leaked" memory seems to include the __tracepoint_ptrs
as well. So at least you seem to have the same behavior as the tracepoint
code, which was your source of inspiration for this implementation,
which is a good start.

So the remaining question is: is this memory allocated for module sections
really leaked for each module, or is it an issue with memory allocation
tracking ?

Thanks,

Mathieu


-- =

Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com

--===============0532004897817440079==--

