Content-Type: multipart/mixed; boundary="===============0134277217573004259=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] staging: wfx: fix potential vulnerability to spectre
Date: Fri, 11 Oct 2019 15:54:47 +0300
Message-ID: <20191011125446.GD4774@kadam>
In-Reply-To: <2165496.I6CF8xJYvu@pc-42>
List-Id: <oe-lkp.lists.linux.dev>

--===============0134277217573004259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2019 at 12:35:36PM +0000, Jerome Pouiller wrote:
> On Friday 11 October 2019 14:10:35 CEST Greg Kroah-Hartman wrote:
> > On Fri, Oct 11, 2019 at 10:15:54AM +0000, Jerome Pouiller wrote:
> > > From: J=C3=A9r=C3=B4me Pouiller <jerome.pouiller@silabs.com>
> > >
> > > array_index_nospec() should be applied after a bound check.
> > >
> > > Fixes: 9bca45f3d6924f19f29c0d019e961af3f41bdc9e ("staging: wfx: allow=
 to send 802.11 frames")
> > =

> > No need for the full sha1, this should be:
> >         Fixes: 9bca45f3d692 ("staging: wfx: allow to send 802.11 frames=
")
> =

> I copy-pasted information from kbuild robot notification.
> =

> I suggest that commit-id in robot notification is also cut down to 12
> characters. Or even better, to use this snippet:
> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> Fixes: 9bca45f3d692 ("staging: wfx: allow to send 802.11 frames")
> =

> (I added lkp(a)lists.01.org in CC but, I am not sure it is the correct
> ML. I am sorry if it is not the case)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git =
staging-testing
head:   d49d1c76b96ebf39539e93d5ab7943a01ef70e4f
commit: 9bca45f3d6924f19f29c0d019e961af3f41bdc9e [55/111] staging: wfx: all=
ow to send 802.11 frames

If you cut and paste then you the "[55/111] " text isn't right either.
Also kbuild works on rebase-able trees as well as non-rebase/published
trees so the hash could change as well.

I am a little bit surprised that checkpatch.pl doesn't complain about
this, though.  You could consider adding that?

regards,
dan carpenter


--===============0134277217573004259==--

