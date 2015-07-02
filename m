Content-Type: multipart/mixed; boundary="===============2716161145552781533=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [iommu/vt] 571dbbd4d04: DMAR-IR: Failed to copy IR table for dmar1 from previous kernel
Date: Thu, 02 Jul 2015 15:56:23 +0800
Message-ID: <1435823783.17694.2.camel@intel.com>
In-Reply-To: <20150702063925.GC16233@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============2716161145552781533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2015-07-02 at 08:39 +0200, Joerg Roedel wrote:
> On Thu, Jul 02, 2015 at 01:14:18PM +0800, Huang Ying wrote:
> > FYI, we noticed the below changes on
> > =

> > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =

> > master
> > commit 571dbbd4d044e11c78bc077acb3ccef4c77b096e ("iommu/vt-d: Don't =

> > disable IR when it was previously enabled")
> > =

> > The following new message in kernel log may make end user =

> > confusing.
> > =

> > [    0.503764] DMAR-IR: IRQ remapping was enabled on dmar0 but we =

> > are not in kdump mode
> > [    0.512418] DMAR-IR: Failed to copy IR table for dmar0 from =

> > previous kernel
> > [    0.520501] DMAR-IR: IRQ remapping was enabled on dmar1 but we =

> > are not in kdump mode
> > [    0.529154] DMAR-IR: Failed to copy IR table for dmar1 from =

> > previous kernel
> > [    0.537077] DMAR-IR: Enabled IRQ remapping in x2apic mode
> =

> This is not a problem, the kernel detected that the IOMMU was already
> enabled, but it is not booting into a kdump kernel so it is not =

> trying
> to copy over translation tables. The messages for this case are =

> indeed a
> bit misleading, it looks like the kernel tried to copy the =

> translation
> tables, but it didn't. I'll fix this.
> =

> What were you doing to trigger this, it is quite uncommon to find the
> IOMMU enabled on a normal kernel boot. Did you boot with kexec into a
> new kernel?

Yes.  We use kexec to boot the new kernel.

Best Regards,
Huang, Ying


--===============2716161145552781533==--

