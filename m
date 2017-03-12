Content-Type: multipart/mixed; boundary="===============0780956832517066975=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [net/bpf] 3051bf36c2 BUG: unable to handle kernel paging request at 0000a7cf
Date: Sun, 12 Mar 2017 22:40:33 +0100
Message-ID: <20170312214033.7zllfclxtjvewo2c@pd.tnic>
In-Reply-To: <CA+55aFy5vi3af5VBuG6ZOdTeKNxqGSq64J-EkrjaRhGVKXPy0A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0780956832517066975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2017 at 03:26:02PM -0800, Linus Torvalds wrote:
> Maybe it's the lguest games with PGE that need to be removed?

Btw, tglx suggested something else the other day: warn when we're
changing boot_cpu_data x86_capability bits *after* alternatives have
run. The reasoning behind it being that potentially some patching
static_cpu_has() has done won't be correct anymore.

And it is pretty cheap to do it, it fires nicely on the 32-bit config
with LGUEST=3Dy.

---
diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufe=
ature.h
index d59c15c3defd..f06c3dc6db70 100644
--- a/arch/x86/include/asm/cpufeature.h
+++ b/arch/x86/include/asm/cpufeature.h
@@ -124,8 +124,18 @@ extern const char * const x86_bug_flags[NBUGINTS*32];
 =

 #define boot_cpu_has(bit)	cpu_has(&boot_cpu_data, bit)
 =

-#define set_cpu_cap(c, bit)	set_bit(bit, (unsigned long *)((c)->x86_capabi=
lity))
-#define clear_cpu_cap(c, bit)	clear_bit(bit, (unsigned long *)((c)->x86_ca=
pability))
+#define set_cpu_cap(c, bit)					\
+({								\
+	WARN_ON(c =3D=3D &boot_cpu_data && alternatives_patched);	\
+	set_bit(bit, (unsigned long *)((c)->x86_capability));	\
+})
+
+#define clear_cpu_cap(c, bit)					\
+({								\
+	WARN_ON(c =3D=3D &boot_cpu_data && alternatives_patched);	\
+	clear_bit(bit, (unsigned long *)((c)->x86_capability));	\
+})
+
 #define setup_clear_cpu_cap(bit) do { \
 	clear_cpu_cap(&boot_cpu_data, bit);	\
 	set_bit(bit, (unsigned long *)cpu_caps_cleared); \

-- =

Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--=20

--===============0780956832517066975==--

