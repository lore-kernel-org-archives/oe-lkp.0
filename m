Content-Type: multipart/mixed; boundary="===============3798717471829221234=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/fb] 1d46491d4a: WARNING:at_drivers/gpu/drm/drm_fb_helper.c:#drm_fb_helper_damage_work[drm_kms_helper]
Date: Thu, 03 Dec 2020 08:41:49 +0100
Message-ID: <eb24560e-e6ef-6a97-10cd-59a167ad3fde@suse.de>
In-Reply-To: <20201202022936.GA12321@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3798717471829221234==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

there should be a line in the kernel log that says something like =

"Damage blitter failed" with an error code. Is there any chance of =

recovering it?

Best regards
Thomas

Am 02.12.20 um 03:29 schrieb kernel test robot:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 1d46491d4a08d7ee657e09808f87d169444a2652 ("drm/fb-helper: Move da=
mage blit code and its setup into separate routine")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> =

> in testcase: locktorture
> version:
> with following parameters:
> =

> 	runtime: 300s
> 	test: cpuhotplug
> =

> test-description: This torture test consists of creating a number of kern=
el threads which acquire the lock and hold it for specific amount of time, =
thus simulating different critical region behaviors.
> test-url: https://www.kernel.org/doc/Documentation/locking/locktorture.txt
> =

> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
8G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------------------------------------=
---------------+------------+------------+
> |                                                                        =
               | fd2d856538 | 1d46491d4a |
> +------------------------------------------------------------------------=
---------------+------------+------------+
> | WARNING:at_drivers/gpu/drm/drm_fb_helper.c:#drm_fb_helper_damage_work[d=
rm_kms_helper] | 0          | 26         |
> | EIP:drm_fb_helper_damage_work                                          =
               | 0          | 26         |
> +------------------------------------------------------------------------=
---------------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [   28.261007] WARNING: CPU: 0 PID: 122 at drivers/gpu/drm/drm_fb_helper.=
c:434 drm_fb_helper_damage_work+0x109/0x2d0 [drm_kms_helper]
> [   28.263802] Modules linked in: locktorture(E) torture(E) mousedev(E) p=
pdev(E) psmouse(E) crc32c_intel(E) input_leds(E) bochs_drm(E) drm_vram_help=
er(E) drm_ttm_helper(E) ttm(E) drm_kms_helper(E) parport_pc(E) rtc_cmos(E) =
parport(E) drm(E) evbug(E) i6300esb(E) i2c_piix4(E) autofs4(E)
> [   28.271897] CPU: 0 PID: 122 Comm: kworker/0:2 Tainted: G            E =
    5.10.0-rc3-01102-g1d46491d4a08 #1
> [   28.273904] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [   28.275819] Workqueue: events drm_fb_helper_damage_work [drm_kms_helpe=
r]
> [   28.279884] EIP: drm_fb_helper_damage_work+0x109/0x2d0 [drm_kms_helper]
> [   28.281467] Code: 47 10 8b 58 2c 85 db 0f 84 bc 01 00 00 e8 1f f0 da f=
4 89 74 24 0c 89 5c 24 08 89 44 24 04 c7 04 24 98 c1 40 df e8 f7 50 1d f5 <=
0f> 0b 31 c9 c7 04 24 01 00 00 00 ba 01 00 00 00 b8 3c e8 40 df e8
> [   28.285055] EAX: 00000036 EBX: c1c91420 ECX: 00000000 EDX: 00000000
> [   28.289443] ESI: fffffff4 EDI: d2014000 EBP: d2c0dee4 ESP: d2c0de9c
> [   28.291058] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010=
292
> [   28.292717] CR0: 80050033 CR2: b727a028 CR3: 12141000 CR4: 00040690
> [   28.294316] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
> [   28.295915] DR6: fffe0ff0 DR7: 00000400
> [   28.300768] Call Trace:
> [   28.302117]  process_one_work+0x31b/0x7b0
> [   28.303532]  ? process_one_work+0x272/0x7b0
> [   28.304976]  worker_thread+0x29a/0x5d0
> [   28.308712]  ? process_one_work+0x7b0/0x7b0
> [   28.310129]  kthread+0x181/0x1a0
> [   28.311464]  ? process_one_work+0x7b0/0x7b0
> [   28.312878]  ? kthread_create_worker_on_cpu+0x30/0x30
> [   28.314318]  ret_from_fork+0x1c/0x28
> [   28.315645] CPU: 0 PID: 122 Comm: kworker/0:2 Tainted: G            E =
    5.10.0-rc3-01102-g1d46491d4a08 #1
> [   28.317414] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [   28.319096] Workqueue: events drm_fb_helper_damage_work [drm_kms_helpe=
r]
> [   28.320674] Call Trace:
> [   28.321947]  dump_stack+0x6d/0x8b
> [   28.323278]  __warn.cold+0x24/0x49
> [   28.324639]  ? drm_fb_helper_damage_work+0x109/0x2d0 [drm_kms_helper]
> [   28.326167]  ? drm_fb_helper_damage_work+0x109/0x2d0 [drm_kms_helper]
> [   28.327670]  ? drm_fb_helper_damage_work+0x109/0x2d0 [drm_kms_helper]
> [   28.329165]  report_bug+0xb0/0xf0
> [   28.330438]  ? irq_work_queue+0x13/0x70
> [   28.331729]  ? exc_overflow+0x60/0x60
> [   28.333002]  handle_bug+0x2a/0x50
> [   28.334227]  exc_invalid_op+0x28/0x80
> [   28.335462]  handle_exception+0x15d/0x15d
> [   28.336729] EIP: drm_fb_helper_damage_work+0x109/0x2d0 [drm_kms_helper]
> [   28.338148] Code: 47 10 8b 58 2c 85 db 0f 84 bc 01 00 00 e8 1f f0 da f=
4 89 74 24 0c 89 5c 24 08 89 44 24 04 c7 04 24 98 c1 40 df e8 f7 50 1d f5 <=
0f> 0b 31 c9 c7 04 24 01 00 00 00 ba 01 00 00 00 b8 3c e8 40 df e8
> [   28.341442] EAX: 00000036 EBX: c1c91420 ECX: 00000000 EDX: 00000000
> [   28.342910] ESI: fffffff4 EDI: d2014000 EBP: d2c0dee4 ESP: d2c0de9c
> [   28.344372] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010=
292
> [   28.345883]  ? cpu_latency_qos_write+0xeb/0xf0
> [   28.347203]  ? run_init_process+0x5b/0x158
> [   28.348483]  ? run_init_process+0x5b/0x158
> [   28.349714]  ? exc_overflow+0x60/0x60
> [   28.350895]  ? drm_fb_helper_damage_work+0x109/0x2d0 [drm_kms_helper]
> [   28.352244]  process_one_work+0x31b/0x7b0
> [   28.353432]  ? process_one_work+0x272/0x7b0
> [   28.354599]  worker_thread+0x29a/0x5d0
> [   28.355730]  ? process_one_work+0x7b0/0x7b0
> [   28.356894]  kthread+0x181/0x1a0
> [   28.357942]  ? process_one_work+0x7b0/0x7b0
> [   28.359019]  ? kthread_create_worker_on_cpu+0x30/0x30
> [   28.360134]  ret_from_fork+0x1c/0x28
> [   28.376652] irq event stamp: 9469
> [   28.377678] hardirqs last  enabled at (9477): [<d3903085>] console_unl=
ock+0x515/0x650
> [   28.378986] hardirqs last disabled at (9484): [<d3902f95>] console_unl=
ock+0x425/0x650
> [   28.380284] softirqs last  enabled at (9464): [<d467123d>] __do_softir=
q+0x3fd/0x57c
> [   28.381595] softirqs last disabled at (9381): [<d382793c>] call_on_sta=
ck+0x4c/0x60
> [   28.382878] ---[ end trace b5fac24d1c204ab3 ]---
> =

> =

> To reproduce:
> =

>          # build kernel
> 	cd linux
> 	cp config-5.10.0-rc3-01102-g1d46491d4a08 .config
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare modules_=
prepare bzImage modules
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 INSTALL_MOD_PATH=3D<mod-insta=
ll-dir> modules_install
> 	cd <mod-install-dir>
> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> =

> =

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script=
 is attached in this email
> =

> =

> =

> Thanks,
> Oliver Sang
> =


-- =

Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--===============3798717471829221234==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="OpenPGP_signature.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCndzRjVCQUFCQ0FBakZpRUV4bmRtL2ZwdU1V
ZHdZRkZvbGgvRTNFUW92K0FGQWwvSWxyMEZBd0FBQUFBQUNna1FsaC9FM0VRb3YrRFoKM0JBQW1j
RkhrTTk0YVJFS0UxQlZhYXpBdDZPY3VUYitPdHFmSmJ4RnFwRGdOckZGRFlOL0czeWI3bEIzRGhV
blNrUnFWbVo5VGlYVQp1a0h5VUpCcXBsYWxiL200UzBEcXgrcHhqbVp0VGt3OGorWWtVd201a1B0
U2VVbTBsUDJEbG5FczNwd0s3bmFYKzVFblVRVEZCdEw5CnVrWkhiWW1NR2c0YTloYUN2aXR1TTVh
bDYybGNpYkJCZ2IrTVBSVWtCcmVVdnVuR2hhT2hRTXo1UitmVmdoWGkzNmhmd2FBTXhUZVIKcXJF
ZDkvV2QvT0dMeTZuQzQzaE5sV1VFNTNQSXJSRWRpWVB0UUczUWZFMFZUVmRqRWtkSDNPOFJZZExW
ZkNSMExZdVR4UkNreC9kMgpOYVhsYWZWd21PRkdxVzM0Z250MzRJTnZXVnlxUVg4dTFoT0h3YkZt
akJjTnZBL1NLdkRkbGZpMXRpUTQrSFB3Y21UVWttSzVPdW03ClNZVmR2Tlg2U013TzFoRERhV0pT
djh1MWpSRFE3SFdUTTYraldKQVBKaUtaOEJaNFpTaXpHNmtPaGNQM0ZpdE1uTDdCUSs5ejdQZHQK
cmJmYTNsQWtyUkJwU3YwaDFwamNLQlVmMVVRSXkzQ0U2NDVuZXBiN28yaDlGblVUQ01tVWVla0xn
bkw4dUczWlV6MytwNS81aVBjaApwK3hRMEZzZTdKbXdKa1NvTnVGcVAreTJVemRaUTl0REZ3ZEpZ
K09RUDU5Qkk3SHpqbnFTVnFqSlc2aUJnamN5Ly8zaC9DT0FVMExTCkR4Z3k0L2swVkFIU0xlQXBR
SE00V0VQOFdJdVJVWTVOYWRJbFpaQXBrTzdNbEdsYzZaM0IyelY3MzNmeUlHV1BUMTZrRmxhWC9Y
Tm8KUDRrPQo9cEM4MAotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============3798717471829221234==--

