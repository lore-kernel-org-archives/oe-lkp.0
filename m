Content-Type: multipart/mixed; boundary="===============5011779156116977879=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Fri, 31 Mar 2017 10:28:15 -0500
Message-ID: <87a881v52o.fsf@xmission.com>
In-Reply-To: <20170331144730.GA10578@tigerII.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============5011779156116977879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sergey Senozhatsky <sergey.senozhatsky@gmail.com> writes:

> On (03/31/17 14:39), Ye Xiaolong wrote:
>> On 03/31, Sergey Senozhatsky wrote:
>> >On (03/31/17 11:35), Sergey Senozhatsky wrote:
>> >[..]
>> >> > [   21.009531] VFS: Warning: trinity-c2 using old stat() call. Reco=
mpile your binary.
>> >> > [   21.148898] VFS: Warning: trinity-c0 using old stat() call. Reco=
mpile your binary.
>> >> > [   22.298208] warning: process `trinity-c2' used the deprecated sy=
sctl system call with =

>> >> > =

>> >> > Elapsed time: 310
>> >> > BUG: kernel reboot-without-warning in test stage
>> >> =

>> >> so as far as I understand, this is the "missing kernel messages"
>> >> type of bug report. a worst case scenario.
>> >
>> >panic() should have called console_flush_on_panic(), which sould have
>> >flushed the messages regardless the printk_kthread state. so it probably
>> >was not panic() that rebooted the kernel. (probably).
>> >
>> >kernel_restart() and kernel_halt() have pr_emerg() messages, printk swi=
tches
>> >to printk_emergency mode the first time it sees EMERG level message. (m=
ay be
>> >we switch to late).
>> >
>> >on the other hand, there is a emergency_restart(), where we don't switch
>> >to printk_emergency mode and don't flush the existing kernel messages.
>> >there is a bunch of places that call emergency_restart(), including sys=
rq.
>> >
>> >may I ask you, how do you usually restart the vm after the test?
>> >`echo X > /proc/sysrq-trigger'?
>> =

>> Yes.
>> =

>> >
>> >does this patch make it any better?
>> =

>> I am trying it and will post the result once I get it.
>
>
> ... I'd also probably add pr_emerg() print-out to emergency_restart(),
> the same way kernel_restart()/kernel_halt()/kernel_power_off() do.
>
> for those cases when emergency_restart() is called with printk in
> kthreaded mode, not in emergency mode.

No. No. No.

emergency_restart should be the equivalent of a watchdog going off.
AKA it is long past the point where you want to be coordinating
with other parts of the kernel.  Rebooting is the priority.
A print statement absolutely does not belong in emergency_restart.

The fact that nothing managed to get printed out without magic flushing
code is highly disturbing.

Looking from the outside this patchset appears to be broken by design.

If you don't want kernel functions suffering from the overhead of
printing to a slow output device, don't do that then.

The point of printk is to give debugging output.  You have fundamentally
incapacitated printk from serving it's primary purpose.

NAK to the entire concept.

Eric

--===============5011779156116977879==--

