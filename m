Content-Type: multipart/mixed; boundary="===============1523054777151355303=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] 63c6a211b0: BUG: sleeping function called from invalid context at mm/memory.c:1207
Date: Thu, 04 Feb 2016 13:29:58 -0800
Message-ID: <20160204132958.f8571de90d56749336c9af05@linux-foundation.org>
In-Reply-To: <87io25e20k.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1523054777151355303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 04 Feb 2016 08:46:03 +0800 kernel test robot <ying.huang@linux.in=
tel.com> wrote:

> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 63c6a211b0eb5b1c86ffdd9d89639fb7f1b70fca ("mm: workingset: per-cgr=
oup cache thrash detection")
> =

> =

> [    8.134495]   No soundcards found.
> [    8.137598] debug: unmapping init [mem 0xffffffff81cdc000-0xffffffff81=
d99fff]
> [    8.137598] debug: unmapping init [mem 0xffffffff81cdc000-0xffffffff81=
d99fff]
> [    8.155388] BUG: sleeping function called from invalid context at mm/m=
emory.c:1207
> [    8.155388] BUG: sleeping function called from invalid context at mm/m=
emory.c:1207
> [    8.158212] in_atomic(): 0, irqs_disabled(): 0, pid: 79, name: mount
> [    8.158212] in_atomic(): 0, irqs_disabled(): 0, pid: 79, name: mount
> [    8.160436] 1 lock held by mount/79:
> [    8.160436] 1 lock held by mount/79:
> [    8.161488]  #0: =

> [    8.161488]  #0:  ( (rcu_read_lockrcu_read_lock){......}){......}, at:=
 , at: [<ffffffff810e4cc9>] rcu_lock_acquire+0x0/0x20
> [<ffffffff810e4cc9>] rcu_lock_acquire+0x0/0x20
> [    8.164136] Preemption disabled at:
> [    8.164136] Preemption disabled at:[<ffffffff8106a358>] vprintk_defaul=
t+0x18/0x1a
> [<ffffffff8106a358>] vprintk_default+0x18/0x1a

I'm not sure why this is pointing at vprintk_default...

mm-workingset-per-cgroup-cache-thrash-detection.patch does have a bug
which could cause this.  It's fixed by
mm-workingset-per-cgroup-cache-thrash-detection-fix.patch.  Was the
-fix patch applied during this testing?

--===============1523054777151355303==--

