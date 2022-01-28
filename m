Content-Type: multipart/mixed; boundary="===============0111764765985842753=="
MIME-Version: 1.0
From: Sean Young <sean@mess.org>
To: lkp@lists.01.org
Subject: Re: [tools headers UAPI] e2bcbd7769: kernel-selftests.ir.make_fail
Date: Fri, 28 Jan 2022 17:38:43 +0000
Message-ID: <YfQqI2ryOYEDuvON@gofer.mess.org>
In-Reply-To: <e5b72f09-a208-a579-3e51-10935ccee1ff@linuxfoundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0111764765985842753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 28, 2022 at 10:27:52AM -0700, Shuah Khan wrote:
> On 1/28/22 9:49 AM, Alexei Starovoitov wrote:
> > On Fri, Jan 28, 2022 at 1:32 AM Sean Young <sean@mess.org> wrote:
> > > =

> =

> > > > ir_loopback.c: In function =E2=80=98main=E2=80=99:
> > > > ir_loopback.c:147:20: error: =E2=80=98RC_PROTO_RCMM32=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98RC_PROTO_RC6_MCE=
=E2=80=99?
> > > >      if (rc_proto =3D=3D RC_PROTO_RCMM32 &&
> > > >                      ^~~~~~~~~~~~~~~
> > > >                      RC_PROTO_RC6_MCE
> > > =

> > > So this commit removes the copy of lirc.h from tools/include/uapi/lin=
ux/lirc.h,
> > > so now the test uses /usr/include/linux/lirc.h. It appears that this =
file
> > > does not have RC_PROTO_RCMM32 defined on this system, which means it =
is a
> > > kernel header from v5.1 or earlier (this was added in commit
> > > 721074b03411327e7bf41555d4cc7c18f49313f7).
> > > =

> > > It looks like this machine is redhat 8.3, which ships with kernel 4.1=
8.
> > > =

> > > I guess my change was far too optimistic; I had no ideal enterprise k=
ernels
> > > were so ancient.
> > > =

> > > We should probably drop e2bcbd7769ee8f05e1b3d10848aace98973844e4. Sor=
ry about
> > > the turbulence.
> > =

> > I'd rather avoid reverting.
> > Just add ifdef or something to shut up the error on old distros.
> > =

> =

> Sean,
> =

> Let's not add release checks.
> =

> Since RC_PROTO_RCMM32 is the only one missing, perhaps you could define
> just that one in ir_loopback.c with a comment that it can be removed.
> =

> ifndef RC_PROTO_RCMM32 ---

Hi Shuah,

I was thinking along the same lines, however RC_PROTO_RCMM32 is an enum
value so a pre-processor #ifdef is not going to work. At the moment I haven=
't
had any bright ideas other than doing a `#define RC_PROTO_RCMM32 26` at the
top of the file.

Open to suggestions.

Thanks,

Sean
--===============0111764765985842753==--

