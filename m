Content-Type: multipart/mixed; boundary="===============3119946198365446337=="
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
To: lkp@lists.01.org
Subject: Re: [drm] e28cd4d0a2: INFO: trying to register non-static key.
Date: Fri, 17 Jun 2016 23:38:17 +0100
Message-ID: <20160617223817.GC26365@nuc-i3427.alporthouse.com>
In-Reply-To: <57646a8e.UuDC1oOY1mGMRtHR%xiaolong.ye@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3119946198365446337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 18, 2016 at 05:24:30AM +0800, kernel test robot wrote:
> [    1.338384] 00:05: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200=
) is a 16550A
> [    1.340531] toshiba: not a supported Toshiba laptop
> [    1.341126] [drm] Initialized drm 1.1.0 20060810
> [    1.342029] INFO: trying to register non-static key.
> [    1.342535] the code is fine but needs lockdep annotation.
> [    1.343074] turning off the locking correctness validator.
> [    1.343610] CPU: 0 PID: 1 Comm: swapper Not tainted 4.7.0-rc2-00564-ge=
28cd4d #1
> [    1.344330] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [    1.345192]  00000000 00000000 d28dbdc8 c12a197b d28dbe04 c1058c18 c16=
986b2 c169870c
> [    1.346063]  c16986e2 c14e3fdc 00000000 00000000 d28dbdf0 c1027c67 000=
00000 00000000
> [    1.346917]  d39e8b24 00000001 00000000 d28dbe74 c105b796 c14e3fdc c1a=
f7ee4 c1af7ee4
> [    1.347772] Call Trace:
> [    1.348031]  [<c12a197b>] dump_stack+0x16/0x18
> [    1.348450]  [<c1058c18>] register_lock_class+0x164/0x3d1
> [    1.348985]  [<c1027c67>] ? kvm_sched_clock_read+0x9/0x18
> [    1.349509]  [<c105b796>] __lock_acquire+0x95/0x13c4
> [    1.350007]  [<c105c7d3>] ? __lock_acquire+0x10d2/0x13c4
> [    1.350530]  [<c10588a5>] ? __lock_is_held+0x24/0x43
> [    1.351029]  [<c105cdac>] lock_acquire+0x59/0x77
> [    1.351477]  [<c1361cf9>] ? drm_connector_register_all+0x1a/0x92
> [    1.352053]  [<c14db8db>] mutex_lock_nested+0x4d/0x2c3
> [    1.352554]  [<c1361cf9>] ? drm_connector_register_all+0x1a/0x92
> [    1.353140]  [<c1361cf9>] ? drm_connector_register_all+0x1a/0x92
> [    1.353720]  [<c105b4bf>] ? trace_hardirqs_on+0xb/0xd
> [    1.354239]  [<c1361cf9>] drm_connector_register_all+0x1a/0x92
> [    1.354845]  [<c10b25be>] ? kstrdup+0x25/0x3a
> [    1.355271]  [<c135e37d>] drm_dev_register+0x59/0x99
> [    1.355781]  [<c195ea3e>] vgem_init+0x34/0x49
> [    1.356213]  [<c195ea0a>] ? mipi_dsi_bus_init+0xf/0xf
> [    1.356702]  [<c100048f>] do_one_initcall+0x7c/0xfd
> [    1.357182]  [<c104b409>] ? parse_args+0x1fd/0x314
> [    1.357648]  [<c1939c10>] ? kernel_init_freeable+0xd0/0x179
> [    1.358203]  [<c1939c2c>] kernel_init_freeable+0xec/0x179
> [    1.358763]  [<c14d66ea>] kernel_init+0x8/0xcb
> [    1.359222]  [<c14debce>] ret_from_kernel_thread+0xe/0x30
> [    1.359744]  [<c14d66e2>] ? rest_init+0x10e/0x10e

Fwiw, I'm looking at polishing up dmabuf support for vGEM and adding a
couple of basic tests using vGEM to BAT. My goal being for testing
PRIME import/fencing within i915.
-Chris

-- =

Chris Wilson, Intel Open Source Technology Centre

--===============3119946198365446337==--

