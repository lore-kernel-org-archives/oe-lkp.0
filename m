Content-Type: multipart/mixed; boundary="===============8329230381088901850=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [vfs] 8bb3c61baf: vm-scalability.median -23.7% regression
Date: Sun, 08 Sep 2019 22:46:01 +0100
Message-ID: <20190908214601.GC1131@ZenIV.linux.org.uk>
In-Reply-To: <20190903084122.GH15734@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8329230381088901850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2019 at 04:41:22PM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -23.7% regression of vm-scalability.median due to commi=
t:
> =

> =

> commit: 8bb3c61bafa8c1cd222ada602bb94ff23119e738 ("vfs: Convert ramfs, sh=
mem, tmpfs, devtmpfs, rootfs to use the new mount API")
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/viro/vfs.git wor=
k.mount
> =

> in testcase: vm-scalability
> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wit=
h 128G memory
> with following parameters:
> =

> 	runtime: 300s
> 	size: 16G
> 	test: shm-pread-rand
> 	cpufreq_governor: performance
> 	ucode: 0xb000036

That thing loses size=3D... option.  Both size=3D and nr_blocks=3D affect t=
he
same thing (->max_blocks), but the parser keeps track of the options
it has seen and applying the parsed data to superblock checks only
whether nr_blocks=3D had been there.  IOW, size=3D gets parsed, but the
result goes nowhere.

I'm not sure whether it's better to fix the patch up or redo it from
scratch - it needs to be carved up anyway and it's highly non-transparent,
so I'm probably going to replace the damn thing entirely with something
that would be easier to follow.

--===============8329230381088901850==--

