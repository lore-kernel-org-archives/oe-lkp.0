Content-Type: multipart/mixed; boundary="===============5912123058696305295=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [locking/mutex] e274795ea7 WARNING: CPU: 0 PID: 1 at arch/x86/include/asm/fpu/internal.h:348 __switch_to
Date: Sat, 18 Feb 2017 11:28:45 +0100
Message-ID: <20170218102845.GF6500@twins.programming.kicks-ass.net>
In-Reply-To: <20170218085746.fojbfjlzdahri5qw@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5912123058696305295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 18, 2017 at 04:57:46PM +0800, Fengguang Wu wrote:
> Hi Peter,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit e274795ea7b7caa0fd74ef651594382a69e2a951
> Author:     Peter Zijlstra <peterz@infradead.org>
> AuthorDate: Wed Jan 11 14:17:48 2017 +0100
> Commit:     Ingo Molnar <mingo@kernel.org>
> CommitDate: Sat Jan 14 11:14:38 2017 +0100

That commit has been in the tree for over a month now.. And I've never
seen a warning like this before.

> =

>      locking/mutex: Fix mutex handoff


>      =

> [   13.377261] Write protecting the kernel text: 15320k
> [   13.378910] Write protecting the kernel read-only data: 6316k
> [   13.380655] NX-protecting the kernel data: 9256k
> [   13.382475] x86/mm: Checked W+X mappings: passed, no W+X pages found.
> [   13.384781] ------------[ cut here ]------------
> [   13.386327] WARNING: CPU: 0 PID: 1 at arch/x86/include/asm/fpu/interna=
l.h:348 __switch_to+0x1b6/0x260

What tree is this? on current next/master that file doesn't have a WARN
on that line.

--===============5912123058696305295==--

