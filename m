Content-Type: multipart/mixed; boundary="===============4136586473819567289=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [EDAC] e3c4ff6d8c: kmsg.EDAC_sbridge:Failed_to_register_device_with_error
Date: Wed, 26 Apr 2017 09:20:05 +0200
Message-ID: <20170426072005.y3u3aiqojccop5ow@pd.tnic>
In-Reply-To: <20170426055035.GG29367@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4136586473819567289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 26, 2017 at 01:50:35PM +0800, Ye Xiaolong wrote:
> On 04/25, Borislav Petkov wrote:
> >On Tue, Apr 25, 2017 at 10:20:09AM +0800, kernel test robot wrote:
> >> =

> >> FYI, we noticed the following commit:
> >> =

> >> commit: e3c4ff6d8c949fa9a9ea1bd005bf1967efe09d5d ("EDAC: Remove EDAC_M=
M_EDAC")
> >> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> >
> >Can you send me full dmesg of a kernel with this patch reverted?
> =

> Please see attached.

Thanks, I see what the problem is: this can happen even without my patch
- my patch just made it happen unconditionally now :)

As a temporary workaround, you could boot with "ghes.disable=3D1" to make
sb_edac load successfully again.

Now on to the bigger question: so Tony we have this ghes_edac thing
which is not a module as it gets stuff delivered from ghes through
ghes_edac_report_mem_error() and ACPI_APEI_GHES is bool itself so it
can't be a module and so on.

Now, the problem then is that ghes_edac gets registered first and the
platform-specific drivers like sb_edac then fail to register as they
come later when built as modules.

Which kinda needs us to talk about prio and what we want to do: do we
want for ghes_edac to have a higher priority in registering with the
system - this is basically what Mauro was aiming at:

  77c5f5d2f212 ("ghes_edac: Register at EDAC core the BIOS report")

or do we want the platform-specific drivers to have prio?

Or do we want the user to decide?

I mean, a lot has changed since then, here's what I'm seeing from here:
from all the boxes I have access to - and there are a bunch - GHES is
either colossally broken or doesn't work as expected or hasn't been
implemented properly or ...

So my reality of it is that I really don't trust BIOS writers (what
else is new?! :)) and I think we're better off having the
platform-specific drivers get higher priority and use ghes_edac only
as a fallback. And the platform-specific drivers get much more work and
scrutiny than some BIOS somewhere. And I'd tend to make that be the
preferred decision but still leave it to the user to decide by stating
edac=3Dprefer_ghes or whatever.

Oh and I've hever heard of people actually using that ghes_edac driver
at all while I do get bug reports about the prominent platform-specific
ones.

So I'd really appreciate your thoughts here...

Thanks.

-- =

Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--=20

--===============4136586473819567289==--

