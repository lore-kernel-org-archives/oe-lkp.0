Content-Type: multipart/mixed; boundary="===============5809135286865142599=="
MIME-Version: 1.0
From: Pavel Machek <pavel@ucw.cz>
To: lkp@lists.01.org
Subject: "interesting" entry in hibernation code was Re: [lkp-robot] [x86/asm] 51bad67ffb: int3:#[##]
Date: Sat, 19 May 2018 09:00:08 +0200
Message-ID: <20180519070008.GC30676@amd>
In-Reply-To: <CA+55aFwrT-BAvdujUonX5MvB=8GFopQJT4x6xMhtjNN2G0AxSw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5809135286865142599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!

> Side note: doing some grepping, I find some other sequences that are a bit
> scary, like this:
> =

> arch/x86/kernel/acpi/wakeup_32.S-.data
> arch/x86/kernel/acpi/wakeup_32.S-ALIGN
> arch/x86/kernel/acpi/wakeup_32.S:ENTRY(saved_magic)     .long   0
> arch/x86/kernel/acpi/wakeup_32.S:ENTRY(saved_eip)       .long   0
> =

> so apparently people are using ENTRY() for data too (the same pattern
> exists in wakeup_64.S).
> =

> So we end up having those odd 0x90 bytes (now 0xcc) in the data section as
> "padding" between those two values. Crazy.

Sorry about that. I'm pretty sure intention was simply to use the
variable from C code.. and ENTRY() worked. I was not aware that it has
side effect of padding...

Let me see how this can be improved... (untested).

diff --git a/arch/x86/kernel/acpi/wakeup_32.S b/arch/x86/kernel/acpi/wakeup=
_32.S
index 0c26b1b..d6f477f 100644
--- a/arch/x86/kernel/acpi/wakeup_32.S
+++ b/arch/x86/kernel/acpi/wakeup_32.S
@@ -89,8 +89,8 @@ ret_point:
 =

 .data
 ALIGN
-ENTRY(saved_magic)	.long	0
-ENTRY(saved_eip)	.long	0
+GLOBAL(saved_magic)	.long	0
+saved_eip:	.long	0
 =

 # saved registers
 saved_idt:	.long	0,0


									Pavel
-- =

(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--===============5809135286865142599==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEKCmlFWUVBUkVD
QUFZRkFsci95M2dBQ2drUU1PZndhcFhiK3ZLNURRQ2dtMFcvcGlwbGtObVpwb3VnUzJab0J1bysK
eTR3QW9MN1dKY0F1RzNKMjgraldINHpxREJiRGF6K0IKPS9EK00KLS0tLS1FTkQgUEdQIFNJR05B
VFVSRS0tLS0tCg==

--===============5809135286865142599==--

