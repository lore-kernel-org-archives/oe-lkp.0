Content-Type: multipart/mixed; boundary="===============9027660358220231915=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched] cd0dc98962: WARNING: CPU: 1 PID: 645 at kernel/sched/rt.c:1161 dequeue_rt_stack+0x2a1/0x300()
Date: Thu, 21 Jan 2016 14:41:38 +0100
Message-ID: <20160121134138.GH6357@twins.programming.kicks-ass.net>
In-Reply-To: <87y4bjtsue.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9027660358220231915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2016 at 01:16:41PM +0800, kernel test robot wrote:

> [   18.469193] ------------[ cut here ]------------
> [   18.470790] WARNING: CPU: 1 PID: 645 at kernel/sched/rt.c:1161 dequeue=
_rt_stack+0x2a1/0x300()
> [   18.474113] Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_r=
esolver sg sd_mod sr_mod cdrom ata_generic pata_acpi crct10dif_pclmul crc32=
_pclmul crc32c_intel ppdev snd_pcm snd_timer snd soundcore aesni_intel lrw =
gf128mul glue_helper ablk_helper cryptd pcspkr serio_raw virtio_scsi ata_pi=
ix i2c_piix4 libata floppy parport_pc parport acpi_cpufreq
> [   18.488019] CPU: 1 PID: 645 Comm: watchdog Not tainted 4.4.0-00534-gcd=
0dc98 #1
> [   18.491076] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [   18.494243]  ffffffff81bb0040 ffff88003fa73d90 ffffffff81413ab2 000000=
0000000000
> [   18.497581]  ffff88003fa73dc8 ffffffff8107a086 ffff88003ec027c0 ffff88=
0037217330
> [   18.501000]  0000000000000000 ffff88003ec0308c 0000000000017180 ffff88=
003fa73dd8
> [   18.504206] Call Trace:
> [   18.505607]  [<ffffffff81413ab2>] dump_stack+0x4b/0x69
> [   18.507326]  [<ffffffff8107a086>] warn_slowpath_common+0x86/0xc0
> [   18.509291]  [<ffffffff8107a17a>] warn_slowpath_null+0x1a/0x20
> [   18.511117]  [<ffffffff810b9e71>] dequeue_rt_stack+0x2a1/0x300
> [   18.513048]  [<ffffffff810ba264>] enqueue_rt_entity+0x24/0x50
> [   18.514803]  [<ffffffff810ba930>] enqueue_task_rt+0x30/0x60
> [   18.516582]  [<ffffffff810a357e>] activate_task+0x5e/0x80
> [   18.518443]  [<ffffffff810a57ec>] wake_up_new_task+0xec/0x1d0
> [   18.520254]  [<ffffffff81079469>] _do_fork+0xd9/0x380
> [   18.522064]  [<ffffffff810797b9>] SyS_clone+0x19/0x20
> [   18.523710]  [<ffffffff818caeae>] entry_SYSCALL_64_fastpath+0x12/0x71
> [   18.525861] ---[ end trace 7604fe74e13e21d2 ]---
> [   18.527238] ------------[ cut here ]------------

Pretty dumb... the below fixes it for me. Thanks!

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2218,6 +2218,10 @@ static void __sched_fork(unsigned long c
 	__dl_clear_params(p);
 =

 	INIT_LIST_HEAD(&p->rt.run_list);
+	p->rt.timeout		=3D 0;
+	p->rt.time_slice	=3D sched_rr_timeslice;
+	p->rt.on_rq		=3D 0;
+	p->rt.on_list		=3D 0;
 =

 #ifdef CONFIG_PREEMPT_NOTIFIERS
 	INIT_HLIST_HEAD(&p->preempt_notifiers);

--===============9027660358220231915==--

