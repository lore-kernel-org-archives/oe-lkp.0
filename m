Content-Type: multipart/mixed; boundary="===============7651188894560698028=="
MIME-Version: 1.0
From: Luck, Tony <tony.luck@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [EDAC] e3c4ff6d8c: kmsg.EDAC_sbridge:Failed_to_register_device_with_error
Date: Wed, 26 Apr 2017 14:06:02 -0700
Message-ID: <20170426210602.GA4839@intel.com>
In-Reply-To: <20170426072005.y3u3aiqojccop5ow@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============7651188894560698028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 26, 2017 at 09:20:05AM +0200, Borislav Petkov wrote:
> On Wed, Apr 26, 2017 at 01:50:35PM +0800, Ye Xiaolong wrote:
> > On 04/25, Borislav Petkov wrote:
> > >On Tue, Apr 25, 2017 at 10:20:09AM +0800, kernel test robot wrote:
> > >> =

> > >> FYI, we noticed the following commit:
> > >> =

> > >> commit: e3c4ff6d8c949fa9a9ea1bd005bf1967efe09d5d ("EDAC: Remove EDAC=
_MM_EDAC")
> > >> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git mas=
ter
> > >
> > >Can you send me full dmesg of a kernel with this patch reverted?
> > =

> > Please see attached.
> =

> Thanks, I see what the problem is: this can happen even without my patch
> - my patch just made it happen unconditionally now :)
> =

> As a temporary workaround, you could boot with "ghes.disable=3D1" to make
> sb_edac load successfully again.
> =

> Now on to the bigger question: so Tony we have this ghes_edac thing
> which is not a module as it gets stuff delivered from ghes through
> ghes_edac_report_mem_error() and ACPI_APEI_GHES is bool itself so it
> can't be a module and so on.
> =

> Now, the problem then is that ghes_edac gets registered first and the
> platform-specific drivers like sb_edac then fail to register as they
> come later when built as modules.
> =

> Which kinda needs us to talk about prio and what we want to do: do we
> want for ghes_edac to have a higher priority in registering with the
> system - this is basically what Mauro was aiming at:
> =

>   77c5f5d2f212 ("ghes_edac: Register at EDAC core the BIOS report")
> =

> or do we want the platform-specific drivers to have prio?
> =

> Or do we want the user to decide?

If there were a sane way for the ghes_edac driver to find out
that it was running on a platform that supported these GHES
error reports from the BIOS, then it would be able to decide
whether to register.

But I don't think there is :-(

So we can either let the user pick. Or change the EDAC registration
mechanism to allow a "better" driver to bump out some other driver
that just beat us to register first.

I.e. we'd keep ghes_edac as a built-in driver, and so it would always
register first.

Then we'd try to load some other driver: sb_edac, skx_edac, etc. If
they get through the platform tests to find they are on the right
cpu model, and they find all the right PCIe devices to access memory
controller registers ... then they call edac_mc_add_mc() to tell
EDAC core they want to run things ... and that supplants ghes_edac.

-Tony

--===============7651188894560698028==--

