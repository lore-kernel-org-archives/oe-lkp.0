Content-Type: multipart/mixed; boundary="===============7752206336858394963=="
MIME-Version: 1.0
From: Willem de Bruijn <willemb@google.com>
To: lkp@lists.01.org
Subject: Re: a4a142d3d7 [ 20.280622] trinity-c6 invoked oom-killer: gfp_mask=0x6002c2(GFP_KERNEL|__GFP_HIGHMEM|__GFP_NOWARN), nodemask=(null), order=0, oom_score_adj=500
Date: Tue, 27 Nov 2018 20:28:15 -0500
Message-ID: <CA+FuTSdaXiNRgKGQyp6XQPcDE0fUtvCrm-zuj6o_Gk4B2VfXeA@mail.gmail.com>
In-Reply-To: <CA+FuTSda9JYMWmRDf4hihj9JyS27bc+ZX6ktnOoLRT+bQPV4xg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7752206336858394963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 27, 2018 at 7:57 PM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> On Tue, Nov 27, 2018 at 7:41 PM kernel test robot <rong.a.chen@intel.co=
m> wrote:
> >
> > Greetings,
> >
> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> >
> > https://github.com/0day-ci/linux/commits/Willem-de-Bruijn/udp-msg_zeroc=
opy/20181127-021130
> >
>
> Thanks for the report. These two traces do seem suspect
>
> There is a known refcounting issue in the version sent for review, that
> I'm working on resolving right now.
>
> But it should not be possible to enter the zerocopy path from
> raw_sendmsg at all. Only from udp_sendmsg, even though both
> end up traversing the relevant new code in ip_append_data.
>
> TL;DR: looking into this report before sending a v3.

Indeed. I rebased this patch from a previous RFC pathset.

But upstream changed in a critical way in between in commit
5cf4a8532c99 ("tcp: really ignore MSG_ZEROCOPY if no
SO_ZEROCOPY").

Before that, a zerocopy sendmsg  would fail unless a socket had
successfully set SO_ZEROCOPY. Which raw sockets cannot.

Since that patch, the test was moved from protocol independent
skbuff code to the only implemented protocol so far, tcp. So I
will need a new test in the ip layer shared by udp, raw and others.

--===============7752206336858394963==--

