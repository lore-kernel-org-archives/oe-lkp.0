Content-Type: multipart/mixed; boundary="===============4270397379392901980=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [blk_mq_register_hctx] 29dee3c03a WARNING: CPU: 0 PID: 5 at lib/refcount.c:114 refcount_inc
Date: Tue, 28 Feb 2017 16:35:08 +0800
Message-ID: <20170228083508.fgcncfhksclb2dei@wfg-t540p.sh.intel.com>
In-Reply-To: <20170228081711.GW6515@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4270397379392901980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2017 at 09:17:11AM +0100, Peter Zijlstra wrote:
>On Tue, Feb 28, 2017 at 12:11:17PM +0800, Fengguang Wu wrote:
>> Hello,
>>
>> FYI, an old blk_mq bug triggers new warnings on this commit. It's very
>> reproducible and you may try the attached reproduce-* script.
>
>> [    4.447772] kobject (ffff88001c041f10): tried to init an initialized =
object, something is seriously wrong.
>> [    4.453395] CPU: 0 PID: 5 Comm: kworker/u2:0 Not tainted 4.10.0-01216=
-g29dee3c #2
>> [    4.455534] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS 1.9.3-20161025_171302-gandalf 04/01/2014
>> [    4.458252] Workqueue: events_unbound async_run_entry_fn
>> [    4.459708] Call Trace:
>> [    4.460611]  dump_stack+0x19/0x27
>> [    4.461652]  kobject_init+0xda/0xf0
>> [    4.462731]  blk_mq_register_dev+0x31/0x150
>> [    4.463990]  blk_register_queue+0x205/0x250
>> [    4.465217]  device_add_disk+0x1ab/0x710
>> [    4.466384]  sd_probe_async+0x11c/0x1e0
>> [    4.467544]  async_run_entry_fn+0xbd/0x220
>> [    4.468760]  process_one_work+0x4a7/0x990
>> [    4.469938]  ? process_one_work+0x348/0x990
>> [    4.471168]  worker_thread+0x342/0x8a0
>> [    4.472300]  ? process_one_work+0x990/0x990
>> [    4.473540]  kthread+0x188/0x190
>> [    4.474557]  ? kthread_create_on_node+0x40/0x40
>> [    4.475850]  ret_from_fork+0x31/0x40
>
>So this was pre-existing wreckage? If so, that needs to be sorted first.
>Because if the kobject stuff is broken, there's no way the refcount
>stuff can begin to work.

Yeah it's old bug that should have existed for quite some time.
It's not quite related to the refcount work, just hoping the new
warning might serve as new clues to help debugging the blk_mq bug.

Thanks,
Fengguang

--===============4270397379392901980==--

