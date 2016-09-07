Content-Type: multipart/mixed; boundary="===============9156461911575416648=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [writeback] 8bc4ad9498: INFO: suspicious RCU usage. ]
Date: Wed, 07 Sep 2016 12:41:03 -0400
Message-ID: <20160907164103.GA1375@htj.duckdns.org>
In-Reply-To: <57c8012a.zlFYe5dba5wTaKD+%xiaolong.ye@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9156461911575416648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 01, 2016 at 06:21:30PM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git wb-=
buf-throttle
> commit 8bc4ad9498f81d6689da42457615db0989e720d3 ("writeback: throttle buf=
fered writeback")
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu Westmere -m 512M
> =

> caused below changes:
> =

> =

> +--------------------------------------+------------+------------+
> |                                      | b2e4e4e34d | 8bc4ad9498 |
> +--------------------------------------+------------+------------+
> | boot_successes                       | 6          | 0          |
> | boot_failures                        | 0          | 8          |
> | INFO:suspicious_RCU_usage            | 0          | 8          |
> | message:INFO:suspicious_RCU_usage    | 0          | 0.0        |
> | pattern:INFO:suspicious_RCU_usage    | 0          | 0          |
> | calltrace:disk_events_workfn         | 0          | 8          |
> | message:calltrace:disk_events_workfn | 0          | 0.0        |
> | pattern:calltrace:disk_events_workfn | 0          | 0          |
> +--------------------------------------+------------+------------+
> =

> =

> =

> [    7.389264] stack backtrace:
> [    7.391300] CPU: 0 PID: 19 Comm: kworker/0:1 Not tainted 4.8.0-rc4-000=
08-g8bc4ad9 #1
> [    7.395279] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [    7.398012] Workqueue: events_freezable_power_ disk_events_workfn
> [    7.399933]  0000000000000000 ffff88003db1f8e8 ffffffff8178ed3b ffff88=
003db184c0
> [    7.404348]  0000000000000001 ffff88003db1f918 ffffffff81123472 ffff88=
003db184c0
> [    7.407158]  ffffffff84091180 0000000000000003 ffff880039d4c400 ffff88=
003db1f938
> [    7.410074] Call Trace:
> [    7.411328]  [<ffffffff8178ed3b>] dump_stack+0x82/0xb8
> [    7.413982]  [<ffffffff81123472>] lockdep_rcu_suspicious+0xf7/0x100
> [    7.415828]  [<ffffffff817873f4>] bio_blkcg+0x89/0x93
> [    7.417336]  [<ffffffff817891f0>] check_blkcg_changed+0x58/0x1b8

Hmm... can't reproduce here on qemu with v4.8-rc5 and the same kernel
config.  Can you please check whether it reproduces on v4.8-rc5?  If
so, is there any way I can get the qemu image and command line used?

Thanks.

-- =

tejun

--===============9156461911575416648==--

