Content-Type: multipart/mixed; boundary="===============7224621151699711122=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [NFSv4] 931437ee2c: BUG: sleeping function called from invalid context at mm/slab.h:393
Date: Fri, 28 Oct 2016 23:08:14 +0200
Message-ID: <20161028210813.6uqeblto2lymdf3b@linutronix.de>
In-Reply-To: <20161025065239.GC3341@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7224621151699711122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2016-10-25 14:52:39 [+0800], kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> https://github.com/0day-ci/linux Sebastian-Andrzej-Siewior/NFSv4-replace-=
seqcount_t-with-a-seqlock_t/20161022-013104
> commit 931437ee2c100a50c36771c947ce3674f8160592 ("NFSv4: replace seqcount=
_t with a seqlock_t")
> =

> in testcase: ebizzy
> with following parameters:
> =

> 	nr_threads: 200%
> 	iterations: 100x
> 	duration: 10s
> =

> =

> ebizzy is designed to generate a workload resembling common web applicati=
on server workloads.
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu kvm64,+ssse3 -m 1G

It can't get it triggered. In fact I never get even close to the code
path. I tried NFS as rootfs and this test of yours. And I tried
"xfstests-dev -nfs" with no luck.
So you have NFS as your rootfs. Anything special on the server side? It
seems to be a basic NFSv4 export.

Sebastian

--===============7224621151699711122==--

