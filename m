Content-Type: multipart/mixed; boundary="===============9142215833541447891=="
MIME-Version: 1.0
From: Lu, Aaron <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs/locks] 52306e882f: stress-ng.lockofd.ops_per_sec -11% regression
Date: Wed, 06 Dec 2017 01:43:52 +0000
Message-ID: <1512524641.18934.2.camel@intel.com>
In-Reply-To: <1512471662.4125.2.camel@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9142215833541447891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-12-05 at 06:01 -0500, Jeff Layton wrote:
> On Tue, 2017-12-05 at 13:57 +0800, Aaron Lu wrote:
> > On Wed, Nov 08, 2017 at 03:22:33PM +0800, Aaron Lu wrote:
> > > On Thu, Sep 28, 2017 at 04:02:23PM +0800, kernel test robot wrote:
> > > > =

> > > > Greeting,
> > > > =

> > > > FYI, we noticed a -11% regression of stress-ng.lockofd.ops_per_sec =
due to commit:
> > > > =

> > > > =

> > > > commit: 52306e882f77d3fd73f91435c41373d634acc5d2 ("fs/locks: Use al=
location rather than the stack in fcntl_getlk()")
> > > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git mas=
ter
> > > =

> > > It's been a while, I wonder what do you think of this regression?
> > > =

> > > The test stresses byte-range locks AFAICS and since the commit uses
> > > dynamic allocation instead of stack for the 'struct file_lock', it so=
unds
> > > natural the performance regressed for this test.
> > > =

> > > Now the question is, do we care about the performance regression here?
> > =

> > Appreciated it if you can share your opinion on this, thanks.
> > =

> > Regards,
> > Aaron
> >  =

> =

> Sorry I missed your earlier mail about this. My feeling is to not worry

Never mind :)

> about it. struct file_lock is rather large, so putting it on the stack
> was always a bit dangerous, and F_GETLK is a rather uncommon operation
> anyway.
> =

> That said, if there are real-world workloads that have regressed because
> of this patch, I'm definitely open to backing it out.
> =

> Does anyone else have opinions on the matter?

Your comments makes sense to me, thanks for the reply.
--===============9142215833541447891==--

