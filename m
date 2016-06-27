Content-Type: multipart/mixed; boundary="===============1042108140695183805=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched] 56c8928eba: INFO: trying to register non-static key.
Date: Mon, 27 Jun 2016 13:22:36 +0200
Message-ID: <20160627112236.GB30909@twins.programming.kicks-ass.net>
In-Reply-To: <5771093b.xqSw3Z0NKNPHfNw8%xiaolong.ye@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1042108140695183805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2016 at 07:08:43PM +0800, kernel test robot wrote:
> [   36.894449] INFO: trying to register non-static key.
> [   36.894450] the code is fine but needs lockdep annotation.
> [   36.894451] turning off the locking correctness validator.
> [   36.894456] CPU: 0 PID: 817 Comm: mount Not tainted 4.7.0-rc4-00255-g5=
6c8928 #1
> [   36.894457] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [   36.894462]  0000000000000000 ffff8800299a3a98 ffffffff81776247 000000=
0000000000
> [   36.894465]  0000000000000001 ffff8800299a3b00 ffffffff8111ebaa ffff88=
00299a3ab8
> [   36.894469]  ffffffff8109b058 00000000299a3ac8 ffffffff81077fe3 ffff88=
00299a3ad8
> [   36.894469] Call Trace:
> [   36.894513]  [<ffffffff81776247>] dump_stack+0x82/0xb8
> [   36.894538]  [<ffffffff8111ebaa>] register_lock_class+0x142/0x2f1
> [   36.894570]  [<ffffffff81121bc7>] __lock_acquire+0x15a/0xe6f
> [   36.894606]  [<ffffffff81122ca5>] lock_acquire+0x13d/0x1d6
> [   36.894612]  [<ffffffff82eced97>] _raw_spin_lock_irq+0x3f/0x75
> [   36.894616]  [<ffffffff82ecb9d8>] __wait_for_common+0x42/0x148
> [   36.894620]  [<ffffffff82ecbb02>] wait_for_completion+0x24/0x26
> [   36.894626]  [<ffffffff810ff577>] kthread_stop+0x107/0x2a2
> [   36.894632]  [<ffffffff810f972e>] destroy_workqueue+0x14d/0x201

I'm thinking this is the same problem as before; because of the stack
being wiped, the lockdep state got trashed and *boom*.

--===============1042108140695183805==--

