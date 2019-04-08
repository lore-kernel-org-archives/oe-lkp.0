Content-Type: multipart/mixed; boundary="===============3433892529323994989=="
MIME-Version: 1.0
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: lkp@lists.01.org
Subject: Re: [srcu] a365bb5f6e: leaking_addresses.proc.___srcu_struct_ptrs.
Date: Mon, 08 Apr 2019 15:47:04 -0400
Message-ID: <1892400867.1780.1554752824625.JavaMail.zimbra@efficios.com>
In-Reply-To: <20190408193514.GD133872@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3433892529323994989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

----- On Apr 8, 2019, at 3:35 PM, Joel Fernandes, Google joel(a)joelfernand=
es.org wrote:

> On Mon, Apr 08, 2019 at 01:25:49PM -0400, Mathieu Desnoyers wrote:
>> ----- On Apr 8, 2019, at 1:10 PM, paulmck paulmck(a)linux.ibm.com wrote:
>> =

>> > On Mon, Apr 08, 2019 at 01:06:56PM -0400, Mathieu Desnoyers wrote:
>> >> ----- On Apr 8, 2019, at 11:21 AM, paulmck paulmck(a)linux.ibm.com wr=
ote:
>> >> =

>> >> > On Mon, Apr 08, 2019 at 10:57:50PM +0800, Rong Chen wrote:
>> >> >> On Mon, Apr 08, 2019 at 07:30:37AM -0700, Paul E. McKenney wrote:
>> >> >> > On Mon, Apr 08, 2019 at 09:56:10PM +0800, kernel test robot wrot=
e:
>> >> >> > > FYI, we noticed the following commit (built with gcc-7):
>> >> >> > > =

>> >> >> > > commit: a365bb5f6eafb220a1448674054b05c250829313 ("srcu: Alloc=
ate per-CPU data
>> >> >> > > for DEFINE_SRCU() in modules")
>> >> >> > > https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu=
.git
>> >> >> > > tmp.2019.04.07a
>> >> >> > > =

>> >> >> > > in testcase: leaking_addresses
>> >> >> > > with following parameters:
>> >> >> > > =

>> >> >> > > =

>> >> >> > > =

>> >> >> > > =

>> >> >> > > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBrid=
ge -smp 2 -m 2G
>> >> >> > > =

>> >> >> > > caused below changes (please refer to attached dmesg/kmsg for =
entire
>> >> >> > > log/backtrace):
>> >> >> > > =

>> >> >> > > =

>> >> >> > > +-------------------------------------------------+-----------=
-+------------+
>> >> >> > > |                                                 | a44a55abae=
 | a365bb5f6e |
>> >> >> > > +-------------------------------------------------+-----------=
-+------------+
>> >> >> > > | boot_successes                                  | 0         =
 | 3          |
>> >> >> > > | boot_failures                                   | 4         =
 | 6          |
>> >> >> > > | BUG:kernel_reboot-without-warning_in_test_stage | 4         =
 | 6          |
>> >> >> > > | leaking_addresses.proc.___srcu_struct_ptrs.     | 0         =
 | 6          |
>> >> >> > > +-------------------------------------------------+-----------=
-+------------+
>> >> >> > =

>> >> >> > Please help me out here.  Without this commit, the kernel never =
succeeds
>> >> >> > in booting, but with it the kernel sometimes succeeds in booting=
?  Or am
>> >> >> > I misinterpreting the above table?
>> >> >> > =

>> >> >> > 							Thanx, Paul
>> >> >> =

>> >> >> Hi Paul,
>> >> >> =

>> >> >> The message "kernel_reboot-without-warning_in_test_stage" is from =
0day,
>> >> >> leaking addresses generated many dmesgs, so 0day thought some boot=
ings may
>> >> >> failed.
>> >> > =

>> >> [...]
>> >> >> > =

>> >> >> > > [1 .rodata.cst16.POLY] 0xffffffffc0498360
>> >> >> > > [1 .rodata.cst32.byteshift_table] 0xffffffffc03f50f0
>> >> >> > > [19 __bug_table] 0xffffffffc02be184
>> >> >> > > [2 __tracepoints_ptrs] 0xffffffffc02f1cd0
>> >> >> > > [15 .smp_locks] 0xffffffffc042b2cc
>> >> >> > > [1 .rodata.cst16.enc] 0xffffffffc0498420
>> >> >> > > [11 __ksymtab_gpl] 0xffffffffc042b028
>> >> >> > > [8 __ex_table] 0xffffffffc04f13f4
>> >> >> > > [1 .init.rodata] 0xffffffffc0316000
>> >> >> > > [36 .note.gnu.build-id] 0xffffffffc03ed000
>> >> >> > > [1 .rodata.cst16.dec] 0xffffffffc0498410
>> >> >> > > [16 .parainstructions] 0xffffffffc03ed940
>> >> >> > > [8 .text..refcount] 0xffffffffc04e2aaa
>> >> >> > > [36 .gnu.linkonce.this_module] 0xffffffffc03f12c0
>> >> >> > > [2 __bpf_raw_tp_map] 0xffffffffc03054a0
>> >> >> > > [30 .orc_unwind_ip] 0xffffffffc03ee9f9
>> >> >> > > [8 .altinstr_replacement] 0xffffffffc0497372
>> >> >> > > [26 .rodata.str1.8] 0xffffffffc03ed1f0
>> >> >> > > [11 __verbose] 0xffffffffc05c9398
>> >> >> > > [1 .rodata.cst16.TWOONE] 0xffffffffc0498380
>> >> >> > > [1 uevent] KEY=3D402000000 3803078f800d001 feffffdfffefffff ff=
fffffffffffffe
>> >> >> > > [1 .rodata.cst16.ONE] 0xffffffffc04983e0
>> >> >> > > [8 .altinstructions] 0xffffffffc0498430
>> >> >> > > [36 modules] crct10dif_pclmul 16384 1 - Live 0xffffffffc03f4000
>> >> >> > > [1 ___srcu_struct_ptrs] 0xffffffffc03840d0
>> >> >> > > =

>> >> =

>> >> This list of "leaked" memory seems to include the __tracepoint_ptrs
>> >> as well. So at least you seem to have the same behavior as the tracep=
oint
>> >> code, which was your source of inspiration for this implementation,
>> >> which is a good start.
>> >> =

>> >> So the remaining question is: is this memory allocated for module sec=
tions
>> >> really leaked for each module, or is it an issue with memory allocati=
on
>> >> tracking ?
>> > =

> =

> It looks to me like this has nothing to do with memory allocation. This is
> the leaking_addresses.pl script isn't it? It basically finds out if
> any /proc filesystem entries or dmesg lines have kernel addresses which c=
ould
> be "leaking" into userspace. I have no idea which filesystem entries leak
> these addresses.
> =

> This commit that introduced the script is:
> =

> commit 136fc5c41f349296db1910677bb7402b0eeff376
> Author: Tobin C. Harding <me@tobin.cc>
> Date:   Mon Nov 6 16:19:27 2017 +1100
> =

>    scripts: add leaking_addresses.pl
> =

>    Currently we are leaking addresses from the kernel to user space. This
>    script is an attempt to find some of those leakages. Script parses
>    `dmesg` output and /proc and /sys files for hex strings that look like
>    kernel addresses.

Then I suspect we have a likely culprit here:

root(a)thinkos:/sys# cat /sys/module/*/sections/__tracepoints_ptrs
0xffffffffc07865c0
0xffffffffc0bad3e8
0xffffffffc0b19808
0xffffffffc0847b80
0xffffffffc0ea7078
0xffffffffc07cb260
0xffffffffc0f32038
0xffffffffc055cc68
0xffffffffc10b1970
0xffffffffc0a209f0
0xffffffffc0612a00
0xffffffffc041df40
0xffffffffc0abe6a8
0xffffffffc09fb688
0xffffffffc0ce8c58
0xffffffffc08b7660
0xffffffffc092bd28
0xffffffffc04ccc90

Which seems to be a "feature" from module.c.

Thanks,

Mathieu

> =

> thanks,
> =

>  - Joel

-- =

Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com

--===============3433892529323994989==--

