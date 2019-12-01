Content-Type: multipart/mixed; boundary="===============5216744090720740975=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] x86/pat: Fix off-by-one bugs in interval tree search
Date: Sun, 01 Dec 2019 21:30:58 +0100
Message-ID: <20191201203058.GA82131@gmail.com>
In-Reply-To: <alpine.DEB.2.21.1912011205350.2748@hp-x360n>
List-Id: <oe-lkp.lists.linux.dev>

--===============5216744090720740975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Kenneth R. Crudup <kenny@panix.com> wrote:

> > > write-combining @ 0x604a800000-0x604b000000
> > > uncached-minus @ 0x604b100000-0x604b110000
> =

> > This WC region was probably unaffected by the bug.
> =

> For my education, and for completeness' sake, is there a proc/sys entry
> that would tell me which device/module has reserved which PAT region?

Not that I know of :-/

I suspect you could run the attached patch and run:

  dmesg | grep -i 'x86/pat'

To see all the ioremap() activities, with a symbolic name of the caller pri=
nted.

I'm quite sure 0x604a800000 will be among them, pointing to somewhere =

like i915_vma_pin_iomap(), ggtt_init_hw() or ggtt_probe_common() in the =

i915 GPU driver?

Another possibility is that this is the FB framebuffer, mapped by =

efifb_probe() or so?

Patch is untested though. :-)

Thanks,

	Ingo

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>

 arch/x86/mm/ioremap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index 1ff9c2030b4f..2f0a4f99471a 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -166,6 +166,8 @@ __ioremap_caller(resource_size_t phys_addr, unsigned lo=
ng size,
 	int retval;
 	void __iomem *ret_addr;
 =

+	printk("# x86/pat: ioremap(%016Lx, %08lx, pcm: %d), caller: %pS\n", phys_=
addr, size, pcm, caller);
+
 	/* Don't allow wraparound or zero size */
 	last_addr =3D phys_addr + size - 1;
 	if (!size || last_addr < phys_addr)

--===============5216744090720740975==--

