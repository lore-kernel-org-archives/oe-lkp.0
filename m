Content-Type: multipart/mixed; boundary="===============4212232121093937251=="
MIME-Version: 1.0
From: Matt Fleming <matt@codeblueprint.co.uk>
To: lkp@lists.01.org
Subject: Re: [x86/mm/ASLR] f47233c2d34: WARNING: CPU: 0 PID: 1 at arch/x86/mm/ioremap.c:63 __ioremap_check_ram+0x445/0x4a0()
Date: Sat, 28 Feb 2015 19:20:09 +0000
Message-ID: <20150228192009.GA2727@codeblueprint.co.uk>
In-Reply-To: <20150228105049.GA11038@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============4212232121093937251==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 28 Feb, at 11:50:49AM, Borislav Petkov wrote:
> =

> Yeah, too many hmms means this still needed staring at to find out what
> exactly the problem is. And the problem is that allocating that struct
> setup_data statically in arch/x86/boot/compressed/aslr.c works only by
> chance, when the kernel decompressing doesn't overwrite that memory.
 =

Doing a static allocation is fine, and the memory is even reserved from
being overwritten via memblock_x86_reserve_range_setup_data(), but it
looks like that reservation gets dropped before
get_setup_data_total_num() runs, which is what is causing ioremap() to
complain - it really is usable RAM we're trying to ioremap().

Dropping the reservation looks to happen in memblock_x86_fill(), because
you'll note that we explicitly reserve the boot services regions
immediately after memblock_x86_fill() in setup_arch().

What isn't clear right now is why the ioremap() warning isn't triggering
for a bunch of other callsites that get this wrong, i.e.
pcibios_add_device().

-- =

Matt Fleming, Intel Open Source Technology Center

--===============4212232121093937251==--

