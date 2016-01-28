Content-Type: multipart/mixed; boundary="===============8617160955051696071=="
MIME-Version: 1.0
From: Florian Westphal <fw@strlen.de>
To: lkp@lists.01.org
Subject: Re: [netfilter: nf_conntrack] b16c29191d: BUG: spinlock recursion on CPU#1, kworker/u4:2/89
Date: Thu, 28 Jan 2016 13:02:41 +0100
Message-ID: <20160128120241.GA30994@breakpoint.cc>
In-Reply-To: <56a9f993.7Xz4J9Nb7thQdQrB%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8617160955051696071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <fengguang.wu@intel.com> wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit b16c29191dc89bd877af99a7b04ce4866728a3e0
> Author:     Sasha Levin <sasha.levin@oracle.com>
> AuthorDate: Mon Jan 18 19:23:51 2016 -0500
> Commit:     Pablo Neira Ayuso <pablo@netfilter.org>
> CommitDate: Wed Jan 20 14:15:31 2016 +0100
> =

>     netfilter: nf_conntrack: use safer way to lock all buckets

Patch errounously converted a spin_unlock to a spin_lock so we have

lock()
foo()
lock()

in ctnl_untimeout().

I'll send a patch soon.

--===============8617160955051696071==--

