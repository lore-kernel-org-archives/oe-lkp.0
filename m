Content-Type: multipart/mixed; boundary="===============4346185439563531871=="
MIME-Version: 1.0
From: Dennis Zhou <dennis@kernel.org>
To: lkp@lists.01.org
Subject: Re: [percpu] ace7e70901: aim9.sync_disk_rw.ops_per_sec -2.3% regression
Date: Fri, 07 May 2021 19:08:03 +0000
Message-ID: <YJWQE8AFjyYpsLYA@google.com>
In-Reply-To: <YJV+Vn9eGfIlxDQE@carbon.dhcp.thefacebook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4346185439563531871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 07, 2021 at 10:52:22AM -0700, Roman Gushchin wrote:
> On Fri, May 07, 2021 at 11:06:06AM +0800, Oliver Sang wrote:
> > hi Roman,
> >  =

> > On Thu, May 06, 2021 at 12:54:59AM +0000, Roman Gushchin wrote:
> > > Ping
> > =

> > sorry for late.
> > =

> > the new patch makes the performance a little better but still has
> > 1.9% regression comparing to
> > f183324133 ("percpu: implement partial chunk depopulation")
> =

> Hi Oliver!
> =

> Thank you for testing it!
> =

> Btw, can you, please, confirm that the regression is coming specifically
> from ace7e70901 ("percpu: use reclaim threshold instead of running for ev=
ery page")?
> I do see *some* regression in my setup, but the data is very noisy, so I'=
m not sure
> I can confirm it.
> =

> Thanks!

Thanks Oliver and Roman. If this is the case, I'll drop the final patch
and just merge up to f183324133 ("percpu: implement partial chunk
depopulation") into for-next as this is v5.14 anyway.

Oliver, is there a way to trigger the kernel test robot for a specific
test?

Thanks,
Dennis
--===============4346185439563531871==--

