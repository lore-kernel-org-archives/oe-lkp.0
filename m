Content-Type: multipart/mixed; boundary="===============7118369114173113672=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: lkp@lists.01.org
Subject: Re: [tcp] 4ecc1baf36: ltp.proc01.fail
Date: Tue, 06 Apr 2021 09:09:32 +0200
Message-ID: <CANn89iL+Df9hDAkt7fPH3Dc-2CDvuLWdUAOuZB77QMNWYu_yMw@mail.gmail.com>
In-Reply-To: <20210406063924.GC7352@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7118369114173113672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 6, 2021 at 8:41 AM kernel test robot <oliver.sang@intel.com> =
wrote:
>
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 4ecc1baf362c5df2dcabe242511e38ee28486545 ("tcp: convert elligible=
 sysctls to u8")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>

I think this has been fixed with commit
d24f511b04b8b159b705ec32a3b8782667d1b06a ("tcp: fix tcp_min_tso_segs sysctl=
")

Thanks

>
> proc01      0  TINFO  :  /proc/sys/fs/binfmt_misc/register: is write-only.
> proc01      1  TFAIL  :  proc01.c:402: read failed: /proc/sys/net/ipv4/tc=
p_min_tso_segs: errno=3DEINVAL(22): Invalid argument

...

> proc01      2  TFAIL  :  proc01.c:471: readproc() failed with 1 errors.
> <<<execution_status>>>
> initiation_status=3D"ok"
> duration=3D2 termination_type=3Dexited termination_id=3D1 corefile=3Dno
> cutime=3D13 cstime=3D233
> Oliver Sang
>
--===============7118369114173113672==--

