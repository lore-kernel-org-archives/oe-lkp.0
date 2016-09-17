Content-Type: multipart/mixed; boundary="===============4329040054911670914=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [workqueue] b9bf4dacf4: BUG: spinlock bad magic on CPU#0, swapper/0
Date: Sat, 17 Sep 2016 13:01:07 -0400
Message-ID: <20160917170107.GA10771@mtj.duckdns.org>
In-Reply-To: <57dc559b.hkeA3X/Cuq4PWAQ1%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4329040054911670914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 17, 2016 at 04:27:07AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git review-wq-early
> =

> commit b9bf4dacf4b10bcd1fad8bd6ce4f9048df1ef89e
> Author:     Tejun Heo <tj@kernel.org>
> AuthorDate: Thu Sep 15 15:19:46 2016 -0400
> Commit:     Tejun Heo <tj@kernel.org>
> CommitDate: Thu Sep 15 15:19:46 2016 -0400
> =

>     workqueue: make workqueue available early during boot
...
> [    0.000000] BUG: spinlock bad magic on CPU#0, swapper/0
> [    0.000000]  lock: timer_bases+0x0/0x1300, .magic: 00000000, .owner: <=
none>/-1, .owner_cpu: 0
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.8.0-rc6-00212-gb=
9bf4da #1
> [    0.000000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [    0.000000]  00000001 79979af5 79a32040 79a07ec4 7924d7e5 79a07ef0 790=
936a3 79941ff6
> [    0.000000]  79a32040 00000000 79979af5 ffffffff 00000000 79a32040 000=
00001 00000000
> [    0.000000]  79a07f04 790936e7 79942058 00000001 79a32040 79a07f28 790=
93796 00000000
> [    0.000000] Call Trace:
> [    0.000000]  [<7924d7e5>] dump_stack+0x16/0x18
> [    0.000000]  [<790936a3>] spin_dump+0x89/0x94
> [    0.000000]  [<790936e7>] spin_bug+0x39/0x3e
> [    0.000000]  [<79093796>] do_raw_spin_lock+0x4f/0x186
> [    0.000000]  [<795b6690>] _raw_spin_lock_irqsave+0x3f/0x48
> [    0.000000]  [<790a9285>] lock_timer_base+0x43/0x77
> [    0.000000]  [<790a945f>] __mod_timer+0xed/0x290
> [    0.000000]  [<790a9625>] mod_timer+0xf/0x11
> [    0.000000]  [<7906cc0f>] wq_watchdog_set_thresh+0x5e/0x61
> [    0.000000]  [<79c78873>] workqueue_init_early+0x32e/0x338

Ah, I should haved moved watchdog init to the late init.  Will update
the patch.

Thanks.

-- =

tejun

--===============4329040054911670914==--

