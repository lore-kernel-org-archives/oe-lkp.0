Content-Type: multipart/mixed; boundary="===============6906904647261836769=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [tcp] e926147618: stress-ng.icmp-flood.ops_per_sec -8.7% regression
Date: Mon, 13 Jun 2022 10:09:43 +0800
Message-ID: <20220613020943.GD75244@shbuild999.sh.intel.com>
In-Reply-To: <20220608073441.GE7547@1wt.eu>
List-Id: <oe-lkp.lists.linux.dev>

--===============6906904647261836769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 08, 2022 at 09:34:41AM +0200, Willy Tarreau wrote:
> On Wed, Jun 08, 2022 at 10:26:12AM +0300, Moshe Kol wrote:
> > Hmm, How is the ICMP flood stress test related to TCP connections?
> =

> To me it's not directly related, unless the test pre-establishes many
> connections, or is affected in a way or another by a larger memory
> allocation of this part.

Fengwei and I discussed and thought this could be a data alignment
related case, that one module's data alignment change affects other
modules' alignment, and we had a patch for detecting similar cases [1]

After some debugging, this could be related with the bss section
alignment changes, that if we forced all module's bss section to be
4KB aligned, then the stress-ng icmp-flood case will have almost no
performance difference for the 2 commits: =


10025135            +0.8%   10105711 =C2=B1  2%  stress-ng.icmp-flood.ops_p=
er_sec

The debug patch is:

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 7fda7f27e7620..7eb626b98620c 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -378,7 +378,9 @@ SECTIONS
 =

 	/* BSS */
 	. =3D ALIGN(PAGE_SIZE);
-	.bss : AT(ADDR(.bss) - LOAD_OFFSET) {
+	.bss : AT(ADDR(.bss) - LOAD_OFFSET)
+	SUBALIGN(PAGE_SIZE)
+	{
 		__bss_start =3D .;
 		*(.bss..page_aligned)
 		. =3D ALIGN(PAGE_SIZE);

The 'table_perturb[]' used to be in bss section, and with the commit
of moving it to runtime allocation, other data structures following it
in the .bss section will get affected accordingly.

Thanks,
Feng


> Willy
--===============6906904647261836769==--

