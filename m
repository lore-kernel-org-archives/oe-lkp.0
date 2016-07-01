Content-Type: multipart/mixed; boundary="===============6046698914709335774=="
MIME-Version: 1.0
From: Baoquan He <bhe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86/KASLR] ed9f007ee6: -- System halted
Date: Fri, 01 Jul 2016 21:25:39 +0800
Message-ID: <20160701132539.GB18214@x1.redhat.com>
In-Reply-To: <20160701131418.GA18214@x1.redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6046698914709335774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/01/16 at 09:14pm, Baoquan He wrote:
> On 07/01/16 at 08:16pm, Ye Xiaolong wrote:
> > On Fri, Jul 01, 2016 at 03:50:32PM +0800, Baoquan He wrote:
> > >Hi Xiaolong,
> > >
> > >Could you please apply below patch and see if it works for you?
> > =

> > Hi, Baoquan,
> > =

> > Please check enclosed dmesg after apply your fix patch, does it meet
> > your expectation?
> =

> It works, but didn't get a random phy addr. I am a little worried. I
> guess your system has a very small physical memory space. Could you
> apply attached patch on top of fix patch and Yinghai's debug patch and
> paste the result? I want to check the physical memory and mem_avoid
> region to make sure it.
> =

> Or if you can paste /proc/iomem I can have a quick check, then you don't
> need to run the patch.

Sorry, Xiaolong, I didn't notice you have pasted the boot log. It's OK
on your system. The fix is good. Since you only make physical memory
320M on that kvm, and the kernel run size need about 152M. It can't
search another suitable position.

I think the fix is good. By the way, are there other test systems, like
with different size of physical memory?

Thanks
Baoquan

> =

> > =

> > Thanks,
> > Xiaolong
> > =

> > >
> > >From 46c2a9ecd11f61d952253e005bbd7dcbffa652fb Mon Sep 17 00:00:00 2001
> > >From: Baoquan He <bhe@redhat.com>
> > >Date: Fri, 1 Jul 2016 15:34:40 +0800
> > >Subject: [PATCH] x86/KASLR: Fix code bug of finding earliest overlap
> > >
> > >Signed-off-by: Baoquan He <bhe@redhat.com>
> > >---
> > > arch/x86/boot/compressed/kaslr.c | 2 ++
> > > 1 file changed, 2 insertions(+)
> > >
> > >diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compress=
ed/kaslr.c
> > >index 304c5c3..8e1fdf7 100644
> > >--- a/arch/x86/boot/compressed/kaslr.c
> > >+++ b/arch/x86/boot/compressed/kaslr.c
> > >@@ -285,6 +285,7 @@ static bool mem_avoid_overlap(struct mem_vector *i=
mg,
> > > 		if (mem_overlaps(img, &mem_avoid[i]) &&
> > > 		    mem_avoid[i].start < earliest) {
> > > 			*overlap =3D mem_avoid[i];
> > >+			earliest =3D overlap->start;
> > > 			is_overlapping =3D true;
> > > 		}
> > > 	}
> > >@@ -299,6 +300,7 @@ static bool mem_avoid_overlap(struct mem_vector *i=
mg,
> > > =

> > > 		if (mem_overlaps(img, &avoid) && (avoid.start < earliest)) {
> > > 			*overlap =3D avoid;
> > >+			earliest =3D overlap->start;
> > > 			is_overlapping =3D true;
> > > 		}
> > > =

> > >-- =

> > >2.5.5
> > >
> =

> =


> diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/=
kaslr.c
> index 8e1fdf7..f2bd558 100644
> --- a/arch/x86/boot/compressed/kaslr.c
> +++ b/arch/x86/boot/compressed/kaslr.c
> @@ -260,6 +260,12 @@ static void mem_avoid_init(unsigned long input, unsi=
gned long input_size,
>  	mem_avoid[MEM_AVOID_BOOTPARAMS].size =3D sizeof(*boot_params);
>  	add_identity_map(mem_avoid[MEM_AVOID_BOOTPARAMS].start,
>  			 mem_avoid[MEM_AVOID_BOOTPARAMS].size);
> +	for(int i=3D0; i<MEM_AVOID_MAX; i++)
> +	debug_printf("      mem_avoid[%d]: [0x%010lx-0x%010lx] 0x%08lx: size\n",
> +		 i,
> +                 (unsigned long)mem_avoid[i].start,
> +                 (unsigned long) mem_avoid[i].start + mem_avoid[i].size =
- 1,
> +                 (unsigned long)mem_avoid[i].size);
>  =

>  	/* We don't need to set a mapping for setup_data. */
>  =

> @@ -376,6 +382,11 @@ static void process_e820_entry(struct e820entry *ent=
ry,
>  	if (entry->type !=3D E820_RAM)
>  		return;
>  =

> +	debug_printf("      e820 entry: [0x%010lx-0x%010lx] 0x%08lx: size\n",
> +                 (unsigned long)entry->addr,
> +                 (unsigned long)entry->addr + entry->size - 1,
> +                 (unsigned long)entry->size);
> +
>  	/* On 32-bit, ignore entries entirely above our maximum. */
>  	if (IS_ENABLED(CONFIG_X86_32) && entry->addr >=3D KERNEL_IMAGE_SIZE)
>  		return;


--===============6046698914709335774==--

