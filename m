Content-Type: multipart/mixed; boundary="===============4734139911440555093=="
MIME-Version: 1.0
From: Marc Zyngier <maz@kernel.org>
To: lkp@lists.01.org
Subject: Re: [irqdomain] 2cb09c90a4: suspend-stress.fail
Date: Wed, 09 Jun 2021 09:23:02 +0100
Message-ID: <878s3jzbtl.wl-maz@kernel.org>
In-Reply-To: <20210609083708.GC15555@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4734139911440555093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

On Wed, 09 Jun 2021 09:37:08 +0100,
Oliver Sang <oliver.sang@intel.com> wrote:
> =

> hi Marc,
> =

> On Wed, Jun 02, 2021 at 05:24:04PM +0100, Marc Zyngier wrote:
> > Hi Rui,
> > =

> > On Wed, 02 Jun 2021 09:25:31 +0100,
> > Zhang Rui <rui.zhang@intel.com> wrote:
> > > =

> > > On Wed, 2021-06-02 at 08:55 +0100, Marc Zyngier wrote:
> > > > Hi Oliver,
> > > > =

> > > > On Wed, 02 Jun 2021 08:12:31 +0100,
> > > > kernel test robot <oliver.sang@intel.com> wrote:
> > > > > =

> > > > > Greeting,
> > > > > =

> > > > > FYI, we noticed the following commit (built with gcc-9):
> > > > > =

> > > > > commit: 2cb09c90a4cde464dbfe78a57a9c128625c31122 ("irqdomain:
> > > > > Introduce irq_resolve_mapping()")
> > > > > https://git.kernel.org/cgit/linux/kernel/git/maz/arm-platforms.git
> > > > > irq/generic_handle_irq_domain
> > =

> > [...]
> > =

> > > >
> > > > Can you give a few more details about the failure mode? Did you
> > > > expect
> > > > the network interface to show up earlier?
> > > =

> > > TBH, we don't know if this is caused by the network failure or not.
> > > It is a remote machine that I need to take some time to verify this.
> > > =

> > > >  How repeatable is this
> > > > issue?
> > > =

> > > It seems to be intermittent but relatively easy to reproduce.
> > > Here is what I did.
> > > 1. run 10 suspend iterations after boot
> > > 2. reboot and repeat step 1 by 10 times.
> > > =

> > > The test is done on three different machines, an old Ivybridge laptop,
> > > a skylake laptop and a kabylake laptop.
> > =

> > Let's just say that I very little idea of what these names represent,
> > but I do have an *old* laptop around (i7-2760QM), on which I was able
> > to reproduce something.
> > =

> > I have the strong feeling that something in the resume path is tearing
> > down a live mapping while the interrupt is being looked up, which
> > would be an interesting bug on its own. But it should be pretty cheap
> > to work around that. Could you try the hack below on top of the
> > offending commit? It did fix the resume issue for me:
> > =

> =

> we tested below patch on platform where we made out original report,
> confirmed the failure was fixed.
> =

> we will try to test on other platforms and if there are any problem,
> we will let you know. Thanks

Great, thanks for letting me know. The fixed version is now in -next.

Should if you spot anything else.

	M.

-- =

Without deviation from the norm, progress is not possible.
--===============4734139911440555093==--

