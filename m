Content-Type: multipart/mixed; boundary="===============2366047414561206632=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 63c6a211b0: BUG: sleeping function called from invalid context at mm/memory.c:1207
Date: Fri, 05 Feb 2016 09:51:06 +0800
Message-ID: <8760y3aprp.fsf@yhuang-dev.intel.com>
In-Reply-To: <20160204132958.f8571de90d56749336c9af05@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2366047414561206632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Andrew Morton <akpm@linux-foundation.org> writes:

> On Thu, 04 Feb 2016 08:46:03 +0800 kernel test robot <ying.huang@linux.=
intel.com> wrote:
>
>> FYI, we noticed the below changes on
>> =

>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mast=
er
>> commit 63c6a211b0eb5b1c86ffdd9d89639fb7f1b70fca ("mm: workingset: per-cg=
roup cache thrash detection")
>> =

>> =

>> [    8.134495]   No soundcards found.
>> [    8.137598] debug: unmapping init [mem 0xffffffff81cdc000-0xffffffff8=
1d99fff]
>> [    8.137598] debug: unmapping init [mem 0xffffffff81cdc000-0xffffffff8=
1d99fff]
>> [    8.155388] BUG: sleeping function called from invalid context at mm/=
memory.c:1207
>> [    8.155388] BUG: sleeping function called from invalid context at mm/=
memory.c:1207
>> [    8.158212] in_atomic(): 0, irqs_disabled(): 0, pid: 79, name: mount
>> [    8.158212] in_atomic(): 0, irqs_disabled(): 0, pid: 79, name: mount
>> [    8.160436] 1 lock held by mount/79:
>> [    8.160436] 1 lock held by mount/79:
>> [    8.161488]  #0: =

>> [ 8.161488] #0: ( (rcu_read_lockrcu_read_lock){......}){......}, at:
>> , at: [<ffffffff810e4cc9>] rcu_lock_acquire+0x0/0x20
>> [<ffffffff810e4cc9>] rcu_lock_acquire+0x0/0x20
>> [    8.164136] Preemption disabled at:
>> [    8.164136] Preemption disabled at:[<ffffffff8106a358>] vprintk_defau=
lt+0x18/0x1a
>> [<ffffffff8106a358>] vprintk_default+0x18/0x1a
>
> I'm not sure why this is pointing at vprintk_default...
>
> mm-workingset-per-cgroup-cache-thrash-detection.patch does have a bug
> which could cause this.  It's fixed by
> mm-workingset-per-cgroup-cache-thrash-detection-fix.patch.  Was the
> -fix patch applied during this testing?

The original test is for linux-next tree of 2016-02-03, which hasn't the
fix patch.  The fix patch is merged by linux-next 2016-02-04.  I queued
the same test for the fix patch and there is no such bug as above.

Best Regards,
Huang, Ying

--===============2366047414561206632==--

