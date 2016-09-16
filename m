Content-Type: multipart/mixed; boundary="===============5358168112093135553=="
MIME-Version: 1.0
From: Florian Westphal <fw@strlen.de>
To: lkp@lists.01.org
Subject: Re: [netfilter-core] [lkp] [netfilter] 68263ddb47: WARNING: CPU: 0 PID: 1225 at net/netfilter/nf_conntrack_seqadj.c:232 nf_ct_seq_offset+0x7a/0x9a
Date: Fri, 16 Sep 2016 19:18:27 +0200
Message-ID: <20160916171827.GE5204@breakpoint.cc>
In-Reply-To: <CA+6hz4o_Jub=zUcnXjy=oXS_5uZkxxw2Jv7p2FvdMqHV0pg+hw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5358168112093135553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Gao Feng <fgao@ikuai8.com> wrote:
> > [   23.465616] ------------[ cut here ]------------
> > [   23.466477] WARNING: CPU: 0 PID: 1225 at net/netfilter/nf_conntrack_=
seqadj.c:232
> > nf_ct_seq_offset+0x7a/0x9a
> > [   23.468458] Missing nfct_seqadj_ext_add() setup call
> >
> =

> It should be that nf_ct_add_synproxy failed and the seqadj extentision is
> not added.

Note that nfct_synproxy_ext_add always returns NULL if
CONFIG_NETFILTER_SYNPROXY=3Dn

The warning should also be removed.

> When nf_ct_add_synproxy fails, the init_conntrack fails too and return
> ERR_PTR(-ENOMEM). In this case, the packet should be dropped directly, and
> should not be processed by the latter codes.

This means the commit breaks conntrack if SYNPROXY=3Dn

--===============5358168112093135553==--

