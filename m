Content-Type: multipart/mixed; boundary="===============2258057297061349398=="
MIME-Version: 1.0
From: Sean Young <sean@mess.org>
To: lkp@lists.01.org
Subject: Re: [tools headers UAPI] e2bcbd7769: kernel-selftests.ir.make_fail
Date: Tue, 01 Feb 2022 16:51:39 +0000
Message-ID: <YfllGx5PRMT9tDDc@gofer.mess.org>
In-Reply-To: <347bae9f-f775-4976-3d27-b0c725211d78@linuxfoundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2258057297061349398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 28, 2022 at 10:57:35AM -0700, Shuah Khan wrote:
> On 1/28/22 10:38 AM, Sean Young wrote:
> > On Fri, Jan 28, 2022 at 10:27:52AM -0700, Shuah Khan wrote:
> > > On 1/28/22 9:49 AM, Alexei Starovoitov wrote:
> > > > On Fri, Jan 28, 2022 at 1:32 AM Sean Young <sean@mess.org> wrote:
> > > > > =

> > > =

> > > > > > ir_loopback.c: In function =E2=80=98main=E2=80=99:
> > > > > > ir_loopback.c:147:20: error: =E2=80=98RC_PROTO_RCMM32=E2=80=99 =
undeclared (first use in this function); did you mean =E2=80=98RC_PROTO_RC6=
_MCE=E2=80=99?
> > > > > >       if (rc_proto =3D=3D RC_PROTO_RCMM32 &&
> > > > > >                       ^~~~~~~~~~~~~~~
> > > > > >                       RC_PROTO_RC6_MCE
> > > > > =

> > > > > So this commit removes the copy of lirc.h from tools/include/uapi=
/linux/lirc.h,
> > > > > so now the test uses /usr/include/linux/lirc.h. It appears that t=
his file
> > > > > does not have RC_PROTO_RCMM32 defined on this system, which means=
 it is a
> > > > > kernel header from v5.1 or earlier (this was added in commit
> > > > > 721074b03411327e7bf41555d4cc7c18f49313f7).
> > > > > =

> > > > > It looks like this machine is redhat 8.3, which ships with kernel=
 4.18.
> > > > > =

> > > > > I guess my change was far too optimistic; I had no ideal enterpri=
se kernels
> > > > > were so ancient.
> =

> > Hi Shuah,
> > =

> > I was thinking along the same lines, however RC_PROTO_RCMM32 is an enum
> > value so a pre-processor #ifdef is not going to work. At the moment I h=
aven't
> > had any bright ideas other than doing a `#define RC_PROTO_RCMM32 26` at=
 the
> > top of the file.
> > =

> =

> One more idea. Let's see if this works. Check for RC_PROTO_MAX if it exis=
ted
> before this commit that RC_PROTO_RCMM32, you could define RC_PROTO_RCMM32
> conditionally in the test scope. If not let's go woth your plan of defini=
ng
> it at the top with some info.

Good idea, this works! patch in another reply in this thread.

Sorry about the mess, thanks for the suggestions.

Sean
--===============2258057297061349398==--

