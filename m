Content-Type: multipart/mixed; boundary="===============1108551112746319684=="
MIME-Version: 1.0
From: Jann Horn <jannh@google.com>
To: lkp@lists.01.org
Subject: Re: [bpf] 568f196756: BUG:assuming_atomic_context_at_kernel/seccomp.c
Date: Sat, 23 Feb 2019 00:15:38 +0100
Message-ID: <CAG48ez009feoF9=AwQ1qHSnuXeFJnAsHREmtrT-+HgPueytyCw@mail.gmail.com>
In-Reply-To: <14415.1550875312@turing-police.cc.vt.edu>
List-Id: <oe-lkp.lists.linux.dev>

--===============1108551112746319684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 22, 2019 at 11:42 PM <valdis.kletnieks@vt.edu> wrote:
>
> On Thu, 21 Feb 2019 14:39:27 +0100, Daniel Borkmann said:
> > Fyi, false positive and already fixed in bpf-next.
> >
> > (https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commi=
t/?id=3D435b3ff5b08a99a15647be32735abf8db66cea9a)
>
> Is there a reason this commit appeared in next-20190221 but did not seem =
to be
> in next-20190222 (confirmed via 'git tag --contains')?
>
> [/usr/src/linux-next] git tag -l next-20190222
> next-20190222
>  [/usr/src/linux-next] git tag --contains 435b3ff5b08a99a15647be32735abf8=
db66cea9a
> next-20190221
>
> (I went ahead and 'git cherry-pick -n' it on top of 0222)

It was reverted by ast@, he wanted to fix it in a different way:
https://lore.kernel.org/netdev/20190221192916.2mcd4fmxbdj2j2u3(a)ast-mbp.dh=
cp.thefacebook.com/

--===============1108551112746319684==--

