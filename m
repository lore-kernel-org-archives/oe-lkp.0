Content-Type: multipart/mixed; boundary="===============8438935032142601633=="
MIME-Version: 1.0
From: Florian Westphal <fw@strlen.de>
To: lkp@lists.01.org
Subject: Re: [netfilter-core] [lkp] [netfilter] 68263ddb47: WARNING: CPU: 0 PID: 1225 at net/netfilter/nf_conntrack_seqadj.c:232 nf_ct_seq_offset+0x7a/0x9a
Date: Sat, 17 Sep 2016 12:40:21 +0200
Message-ID: <20160917104021.GF5204@breakpoint.cc>
In-Reply-To: <CA+6hz4rLzt+u8P+4rOrc3brp4kNK6DrCk546G-jGvcVPVcDmrg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8438935032142601633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Gao Feng <fgao@ikuai8.com> wrote:

[ drop netdev & coreteam from cc list ]

> On Sat, Sep 17, 2016 at 1:18 AM, Florian Westphal <fw@strlen.de> wrote:
> =

> > Gao Feng <fgao@ikuai8.com> wrote:
> > > > [   23.465616] ------------[ cut here ]------------
> > > > [   23.466477] WARNING: CPU: 0 PID: 1225 at net/netfilter/nf_conntr=
ack_
> > seqadj.c:232
> > > > nf_ct_seq_offset+0x7a/0x9a
> > > > [   23.468458] Missing nfct_seqadj_ext_add() setup call
> > > >
> > >
> > > It should be that nf_ct_add_synproxy failed and the seqadj extentisio=
n is
> > > not added.
> >
> > Note that nfct_synproxy_ext_add always returns NULL if
> > CONFIG_NETFILTER_SYNPROXY=3Dn
> >
> > The warning should also be removed.
> =

> =

> When CONFIG_NETFILTER_SYNPROXY=3DNULL, it will not reach
> nfct_synproxy_ext_add, because nfct_synproxy also returns the NULL.

Right.  Apologies, I did not realize this report is about an old
revision of the patch that was never applied to the tree.

So I think we can just ignore this report.

[ its this patch:
  https://patchwork.ozlabs.org/patch/665102/ ]

> I am not clear why the commit breaks conntrack when if SYNPROXY=3Dn based=
 on
> my response above.

Its fine, forget about it.

--===============8438935032142601633==--

