Content-Type: multipart/mixed; boundary="===============3426337956994385408=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Mon, 10 Apr 2017 13:46:19 +0900
Message-ID: <20170410044619.GA2793@jagdpanzerIV.localdomain>
In-Reply-To: <87shlhv3uv.fsf@xmission.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3426337956994385408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Eric,

On (04/09/17 13:21), Eric W. Biederman wrote:
[..]
> It sounds like you are blaming printk when the problem is a very slow
> logging device.

sure, slow logging device definitely adds up to the problem. if there
is no delay in call_console_driver() then printk()->console_unlock()
take no time. anything (uart, fbdev, etc.) that makes call_console_drivers()
slower makes printk() slower. the patch set is not about offloading during
panic(), when offloading make no sense, as you mentioned, or about
uncommon/extreme/impossible cases of 45sec delays in printk. no.

but about the fact that printk() called from inappropriate context
can introduce delays/timeouts/stalls and lockups. several CPUs may call
printk simultaneously, but we don't have any mechanism that would grant
console_sem ownership to a CPU in !atomic context. the winner (the CPU
that first acquires console_sem) prints it all, as long as there are
pending messages.

e.g.
 lkml.kernel.org/r/20160701165959.GR12473(a)ubuntu
e.g.
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
kernel/printk/printk.c?id=3D8d91f8b15361dfb438ab6eb3b319e2ded43458ff

and so on.

I've even seen when printk->console_unlock() invoked from RCU read side
caused OOM condition (some RCU protected objects are small, but some are
big -- e.g. slab pages: kmem_rcu_free()). that's very rare, but I've seen
it.

so there are too many uncertainties and too many inappropriate contexts
for printk.

but yes, you are right, if there is nothing that makes call_console_driver()
slow, then there is no issue.

	-ss

--===============3426337956994385408==--

