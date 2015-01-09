Content-Type: multipart/mixed; boundary="===============6117628979366423129=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [xen] 054954eb051f: -49.7% kernel-size.bss
Date: Fri, 09 Jan 2015 08:46:14 +0800
Message-ID: <1420764374.6201.116.camel@linux.intel.com>
In-Reply-To: <54AE9781.5050501@citrix.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6117628979366423129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2015-01-08 at 14:43 +0000, David Vrabel wrote:
> On 08/01/15 02:58, Huang Ying wrote:
> > FYI, we noticed the below changes on
> > =

> > commit 054954eb051f35e74b75a566a96fe756015352c8 ("xen: switch to linear=
 virtual mapped sparse p2m list")
> > =

> > testbox/testcase/testparams: vm-kbuild-yocto-ia32/boot/1
> > =

> > 0aad5689837c882d  054954eb051f35e74b75a566a9  =

> > ----------------  --------------------------  =

> >          %stddev     %change         %stddev
> >              \          |                \  =

> >    4161536 =C2=B1  0%     -49.7%    2093056 =C2=B1  0%  kernel-size.bss
> =

> This is a good thing, right?

Yes.  I think so.

> >                                     kernel-size.bss
> > =

> >   4.5e+06 *+-*--*--*-*--*--*--*--*--*--*--*-*--*--*--*-----------------=
-----+
> >           |                                             *..*..         =
     |
> >           |                                                   *..*.*..*=
..*..*
> >     4e+06 ++                                                           =
     |
> >           |                                                            =
     |
> >           |                                                            =
     |
> >   3.5e+06 ++                                                           =
     |
> >           |                                                            =
     |
> >     3e+06 ++                                                           =
     |
> >           |                                                            =
     |
> >           |                                                            =
     |
> >   2.5e+06 ++                                                           =
     |
> >           |                                                            =
     |
> >           O  O  O  O O  O  O  O  O  O  O  O O  O  O  O  O  O  O  O O   =
     |
> >     2e+06 ++-----------------------------------------------------------=
-----+
> =

> I have no idea what this graph is supposed to be showing.
> =


It shows the kernel-size.bss during bisection.  From it, it can be seen
that the bisect should be good, the good value points are separated with
the bad value points clearly.

Best Regards,
Huang, Ying



--===============6117628979366423129==--

