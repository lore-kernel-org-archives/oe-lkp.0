Content-Type: multipart/mixed; boundary="===============8790799374579907799=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/asm] 51bad67ffb: int3:#[##]
Date: Tue, 15 May 2018 16:05:33 -0700
Message-ID: <CA+55aFwrT-BAvdujUonX5MvB=8GFopQJT4x6xMhtjNN2G0AxSw@mail.gmail.com>
In-Reply-To: <CA+55aFzTpkn_fokmm+ddi+cgk5K3EOftRmPad+NkUb5W2z0Fqg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8790799374579907799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Side note: doing some grepping, I find some other sequences that are a bit
scary, like this:

arch/x86/kernel/acpi/wakeup_32.S-.data
arch/x86/kernel/acpi/wakeup_32.S-ALIGN
arch/x86/kernel/acpi/wakeup_32.S:ENTRY(saved_magic)     .long   0
arch/x86/kernel/acpi/wakeup_32.S:ENTRY(saved_eip)       .long   0

so apparently people are using ENTRY() for data too (the same pattern
exists in wakeup_64.S).

So we end up having those odd 0x90 bytes (now 0xcc) in the data section as
"padding" between those two values. Crazy.

Not an actual problem, but it does show that people seem to be mis-using
ENTRY().

There that padding is actually entirely wrong. We do *not* want to pad
between those "saved_xyz" fields. I think those should use GLOBAL too.

Or lookie here:

arch/x86/kernel/head_32.S-# boot GDT descriptor (later on used by CPU#0):
arch/x86/kernel/head_32.S-      .word 0                         # 32 bit
align gdt_desc.address
arch/x86/kernel/head_32.S:ENTRY(early_gdt_descr)
arch/x86/kernel/head_32.S-      .word GDT_ENTRIES*8-1
arch/x86/kernel/head_32.S-      .long gdt_page                  /*
Overwritten for secondary CPUs */

where ENTRY() will actually screw up how the code says it wants to align
the address, but now it doesn't.

I wonder if there's some way to add a test for "ENTRY only works in a code
section"?

My grep was just me doing a visual scan, I might have missed something.

               Linus

--===============8790799374579907799==--

