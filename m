Content-Type: multipart/mixed; boundary="===============1337278834440790523=="
MIME-Version: 1.0
From: Peter Xu <peterx@redhat.com>
To: lkp@lists.01.org
Subject: Re: e7e61e51f9 ("fw_cfg: do DMA read operation"): kernel BUG at arch/x86/mm/physaddr.c:75!
Date: Tue, 06 Feb 2018 15:08:47 +0800
Message-ID: <20180206070847.GB25932@xz-mi>
In-Reply-To: <CAMxuvaxa2n-W3uamPJujFR-ybuxx3fYYUdWAkXBPGXrwhPk7Zg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1337278834440790523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 02, 2018 at 11:59:00AM +0100, Marc-Andre Lureau wrote:
> Hi
> =

> On Fri, Feb 2, 2018 at 3:19 AM, Michael S. Tsirkin <mst@redhat.com> wro=
te:
> > On Fri, Feb 02, 2018 at 06:01:01AM +0800, kernel test robot wrote:
> >> Greetings,
> >>
> >> 0day kernel testing robot got the below dmesg and the first bad commit=
 is
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git ma=
ster
> >>
> >> commit e7e61e51f97355bd0bfcba115829fafe81681133
> >> Author:     Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> AuthorDate: Tue Jan 23 17:40:39 2018 +0100
> >> Commit:     Michael S. Tsirkin <mst@redhat.com>
> >> CommitDate: Wed Jan 31 01:47:37 2018 +0200
> >>
> >>     fw_cfg: do DMA read operation
> >>
> >>     Modify fw_cfg_read_blob() to use DMA if the device supports it.
> >>     Return errors, because the operation may fail.
> >>
> >>     The DMA operation is expected to run synchronously with today qemu,
> >>     but the specification states that it may become async, so we run
> >>     "control" field check in a loop for eventual changes.
> >>
> >>     We may want to switch all the *buf addresses to use only kmalloc'ed
> >>     buffers (instead of using stack/image addresses with dma=3Dfalse).
> >>
> >>     Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.c=
om>
> >>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >>     Acked-by: Peter Xu <peterx@redhat.com>
> >>
> >> 2e63155a7c  fw_cfg: add DMA register
> >> e7e61e51f9  fw_cfg: do DMA read operation
> >> f26e52e08a  Add linux-next specific files for 20180201
> >> +------------------------------------------+------------+------------+=
---------------+
> >> |                                          | 2e63155a7c | e7e61e51f9 |=
 next-20180201 |
> >> +------------------------------------------+------------+------------+=
---------------+
> >> | boot_successes                           | 35         | 0          |=
 0             |
> >> | boot_failures                            | 0          | 15         |=
 11            |
> >> | kernel_BUG_at_arch/x86/mm/physaddr.c     | 0          | 15         |=
 11            |
> >> | invalid_opcode:#[##]                     | 0          | 15         |=
 11            |
> >> | EIP:__phys_addr                          | 0          | 15         |=
 11            |
> >> | Kernel_panic-not_syncing:Fatal_exception | 0          | 15         |=
 11            |
> >> +------------------------------------------+------------+------------+=
---------------+
> >>
> >> [   12.081587] Driver for 1-wire Dallas network protocol.
> >> [   12.082466] w1_f0d_init()
> >> [   12.083421] sdhci: Secure Digital Host Controller Interface driver
> >> [   12.084331] sdhci: Copyright(c) Pierre Ossman
> >> [   12.090633] ------------[ cut here ]------------
> >> [   12.091317] kernel BUG at arch/x86/mm/physaddr.c:75!
> >> [   12.092306] invalid opcode: 0000 [#1] PREEMPT SMP DEBUG_PAGEALLOC
> >> [   12.093194] Modules linked in:
> >> [   12.093354] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.15.0-00009-=
ge7e61e5 #1
> >> [   12.093354] EIP: __phys_addr+0x48/0x90
> >> [   12.093354] EFLAGS: 00210213 CPU: 0
> >> [   12.093354] EAX: 00000000 EBX: cd4dde40 ECX: 7c3dbb35 EDX: 00000001
> >> [   12.093354] ESI: 00000004 EDI: 04000000 EBP: cf01bd9c ESP: cf01bd88
> >> [   12.093354]  DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
> >> [   12.093354] CR0: 80050033 CR2: 00000000 CR3: 01afa000 CR4: 00140690
> >> [   12.093354] Call Trace:
> >> [   12.093354]  ? fw_cfg_dma_transfer+0x33/0xb0
> >> [   12.093354]  fw_cfg_read_blob+0x9d/0x220
> >> [   12.093354]  fw_cfg_sysfs_probe+0x263/0x670
> >> [   12.093354]  ? mutex_unlock+0xb/0x10
> >> [   12.093354]  platform_drv_probe+0x44/0xc0
> >> [   12.093354]  ? devices_kset_move_last+0x67/0x90
> >> [   12.093354]  driver_probe_device+0x23d/0x2e0
> >> [   12.093354]  ? acpi_driver_match_device+0x27/0x70
> >> [   12.093354]  __driver_attach+0xa1/0xb0
> >> [   12.093354]  ? driver_probe_device+0x2e0/0x2e0
> >> [   12.093354]  bus_for_each_dev+0x4f/0x90
> >> [   12.093354]  driver_attach+0x19/0x20
> >> [   12.093354]  ? driver_probe_device+0x2e0/0x2e0
> >> [   12.093354]  bus_add_driver+0x197/0x210
> >> [   12.093354]  ? firmware_map_add_early+0x47/0x47
> >> [   12.093354]  driver_register+0x54/0xe0
> >> [   12.093354]  __platform_driver_register+0x2a/0x30
> >> [   12.093354]  fw_cfg_sysfs_init+0x2f/0x53
> >> [   12.093354]  do_one_initcall+0x41/0x183
> >> [   12.093354]  ? parse_args+0xb6/0x300
> >> [   12.093354]  ? do_early_param+0x73/0x73
> >> [   12.093354]  kernel_init_freeable+0x178/0x1fc
> >> [   12.093354]  ? rest_init+0xe0/0xe0
> >> [   12.093354]  kernel_init+0xb/0x100
> >> [   12.093354]  ? schedule_tail_wrapper+0x9/0xc
> >> [   12.093354]  ret_from_fork+0x2e/0x38
> >> [   12.093354] Code: 87 0f c2 85 d2 74 12 89 d9 c1 e9 0c 39 ca 72 13 e=
8 7e ce ff ff 39 c3 75 4a 89 d8 5b 5d c3 90 8d 74 26 00 0f 0b 8d b6 00 00 0=
0 00 <0f> 0b 8d b6 00 00 00 00 8b 0d 00 87 0f c2 8d 91 00 00 80 00 39
> >> [   12.093354] EIP: __phys_addr+0x48/0x90 SS:ESP: 0068:cf01bd88
> >> [   12.119458] ---[ end trace ac8e79b92be7b5f1 ]---
> >
> >
> > Marc-Andr=C3=A9 once you run into DMA issues you really should
> > start testing with 32 bit or something else where
> > it's not just a NOP or an offset.
> >
> > And I wonder:
> >
> > static ssize_t fw_cfg_dma_transfer(struct device *dev,
> >                                 void *address, u32 length, u32 control)
> > {
> >         phys_addr_t dma;
> >         struct fw_cfg_dma *d =3D NULL;
> >         ssize_t ret =3D length;
> >
> >         d =3D kmalloc(sizeof(*d), GFP_KERNEL);
> >         if (!d) {
> >                 ret =3D -ENOMEM;
> >                 goto end;
> >         }
> >
> >         *d =3D (struct fw_cfg_dma) {
> >                 .address =3D cpu_to_be64(virt_to_phys(address)),
> >                 .length =3D cpu_to_be32(length),
> >                 .control =3D cpu_to_be32(control)
> >         };
> >
> >         dma =3D virt_to_phys(d);
> >
> > so address must be a valid target for virt_to_phys.
> >
> > And it's absolutely not in lots of callers.
> =

> > Even in fw_cfg_sysfs_read_raw there's no guarantee that
> > you can DMA directly into that buffer.
> >
> =

> There is "bool dma" in fw_cfg_read_blob() and we use this to only use
> DMA on kmalloc buffers, although in the case of
> fw_cfg_sysfs_read_raw() it is not under our control, so we may want to
> stay safe there (as long as people don't use fw-cfg during boot, at
> which point DMA improves a lot the boot time!).
> =

> > Not even talking about things like
> >                         ret =3D fw_cfg_dma_transfer(dev, NULL, pos, FW_=
CFG_DMA_CTL_SKIP);
> >
> >
> =

> That's actually the regression, before Peter patch squashed in v10, we
> checked if the given address wasn't NULL before doing dma_map_single.
> Now it is gone and raises the panic.
> =

> Thus, the diff I propose is:
> =

> diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cf=
g.c
> index 3b3cf6222c97..08309939cd94 100644
> --- a/drivers/firmware/qemu_fw_cfg.c
> +++ b/drivers/firmware/qemu_fw_cfg.c
> @@ -128,7 +128,7 @@ static ssize_t fw_cfg_dma_transfer(struct device *dev,
>         }
> =

>         *d =3D (struct fw_cfg_dma) {
> -               .address =3D cpu_to_be64(virt_to_phys(address)),
> +               .address =3D address ? cpu_to_be64(virt_to_phys(address))=
 : 0,
>                 .length =3D cpu_to_be32(length),
>                 .control =3D cpu_to_be32(control)
>         };
> @@ -518,7 +518,8 @@ static ssize_t fw_cfg_sysfs_read_raw(struct file
> *filp, struct kobject *kobj,
>         if (count > entry->f.size - pos)
>                 count =3D entry->f.size - pos;
> =

> -       return fw_cfg_read_blob(dev, entry->f.select, buf, pos, count, tr=
ue);
> +       /* do not use DMA, virt_to_phys(buf) might not be ok */

Nit: I would prefer mentioning the thing behind: "Do not use DMA,
since the buffer may not be physically continuous."

> +       return fw_cfg_read_blob(dev, entry->f.select, buf, pos, count, fa=
lse);
>  }
> =

> (and I tested it works both with x86 and x86_64 kernel/qemu)
> =

> thanks

The change looks good to me.  Thanks,

-- =

Peter Xu

--===============1337278834440790523==--

