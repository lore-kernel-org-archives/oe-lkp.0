Content-Type: multipart/mixed; boundary="===============4418284701471385820=="
MIME-Version: 1.0
From: Valentin Schneider <valentin.schneider@arm.com>
To: lkp@lists.01.org
Subject: Re: [sched] 10e7071b2f: BUG:kernel_NULL_pointer_dereference, address
Date: Thu, 07 Nov 2019 11:41:38 +0000
Message-ID: <fc023bbd-e282-c986-b43b-18ac31b2e362@arm.com>
In-Reply-To: <20191107090808.GW29418@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4418284701471385820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/11/2019 09:08, kernel test robot wrote:
> [   84.432464] BUG: kernel NULL pointer dereference, address: 00000000000=
00064
> [   84.433700] #PF: supervisor read access in kernel mode
> [   84.434589] #PF: error_code(0x0000) - not-present page
> [   84.435499] PGD 0 P4D 0 =

> [   84.435933] Oops: 0000 [#1] SMP PTI
> [   84.436581] CPU: 1 PID: 15 Comm: migration/1 Not tainted 5.3.0-rc1-000=
86-g10e7071b2f491 #1
> [   84.438004] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   84.439461] RIP: 0010:pick_next_task_dl+0xe/0xf0
> [   84.440266] Code: ed bd 70 01 01 e8 42 2d fb ff 0f 0b e9 6b ff ff ff 6=
6 66 2e 0f 1f 84 00 00 00 00 00 66 66 66 66 90 55 53 48 89 fb 48 83 ec 10 <=
8b> 46 64 85 c0 78 73 48 81 7e 78 a0 3f e2 a7 74 57 48 83 bb 10 09
> [   84.443485] RSP: 0000:ffffa5518008bd40 EFLAGS: 00010082
> [   84.444423] RAX: ffffffffa6eeeae0 RBX: ffff98ebbfd2b0c0 RCX: ffff98ebb=
fd2d040
> [   84.445641] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff98ebb=
fd2b0c0
> [   84.446877] RBP: ffffa5518008bdc0 R08: 0000001ac1016512 R09: 000000000=
0000001
> [   84.448128] R10: ffffffffa863e640 R11: 0000000000000003 R12: ffff98ebb=
fd2b0c0
> [   84.449349] R13: ffffffffa7e23fa0 R14: ffffffffa7e24060 R15: 000000000=
0000000
> [   84.450603] FS:  0000000000000000(0000) GS:ffff98ebbfd00000(0000) knlG=
S:0000000000000000
> [   84.452007] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   84.453022] CR2: 0000000000000064 CR3: 00000001aab84000 CR4: 000000000=
00406e0
> [   84.454244] Call Trace:
> [   84.455263]  ? update_rq_clock+0x6d/0xe0
> [   84.456081]  sched_cpu_dying+0x104/0x380
> [   84.456777]  ? sched_cpu_starting+0xf0/0xf0
> [   84.457510]  cpuhp_invoke_callback+0x86/0x5d0
> [   84.458279]  ? cpu_disable_common+0x292/0x2b0
> [   84.459047]  take_cpu_down+0x60/0xb0
> [   84.459649]  multi_cpu_stop+0x6b/0x100
> [   84.460339]  ? stop_machine_yield+0x10/0x10
> [   84.461078]  cpu_stopper_thread+0x9e/0x110
> [   84.461809]  ? smpboot_thread_fn+0x2f/0x1e0
> [   84.462539]  ? smpboot_thread_fn+0x74/0x1e0
> [   84.463280]  ? smpboot_thread_fn+0x14e/0x1e0
> [   84.464024]  smpboot_thread_fn+0x149/0x1e0
> [   84.464768]  ? sort_range+0x20/0x20
> [   84.465389]  kthread+0x11e/0x140
> [   84.465961]  ? kthread_park+0xa0/0xa0
> [   84.466605]  ret_from_fork+0x35/0x40
> [   84.467236] Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_r=
esolver binfmt_misc intel_rapl_msr intel_rapl_common sr_mod crct10dif_pclmu=
l cdrom crc32_pclmul sg crc32c_intel ghash_clmulni_intel ata_generic pata_a=
cpi ppdev bochs_drm drm_vram_helper ttm drm_kms_helper syscopyarea sysfillr=
ect snd_pcm sysimgblt fb_sys_fops drm aesni_intel snd_timer ata_piix crypto=
_simd snd cryptd glue_helper libata soundcore pcspkr joydev serio_raw parpo=
rt_pc i2c_piix4 parport floppy ip_tables
> [   84.474471] CR2: 0000000000000064
> [   84.475066] ---[ end trace af8f1919a81ca744 ]---
> =


It would be really nice if the lkpbot could feed this through
scripts/decode_stracktrace.sh too.


AFAICT this is dying in __pick_migrate_task(), where we have a =

pick_next_task()/put_prev_task() dance. Sounds oddly familiar :-)

However I don't think we have an issue with the lock being released when
we reach pick_next_task_fair() - if we ever reach the newidle_balance()
in there it means we didn't have any CFS task to play with in the first
place.

We *may* e.g. go through sched_move_task() on a task we'll end up picking
via active balance, but AFAICT that would be harmless:


__pick_migrate_task()
  ...
  pick_next_task_fair()
    newidle_balance()
      drop lock
                                  sched_move_task()
                                    put_prev_task()
                                    set_next_task()
  active balance
  ...
  put_prev_task()
              =

          =

On top of that, the deathpoint seems to be select_task_rq_dl() which would
happen way before we reach fair. I don't see anything obvious by staring
at the old fake task pick loop vs __pick_migrate_task(). Lemme try to
reproduce.

> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-5.3.0-rc1-00086-g10e7071b2f491 .config
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig prepare module=
s_prepare bzImage
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
> =

> =

> =

> Thanks,
> lkp
>=20
--===============4418284701471385820==--

