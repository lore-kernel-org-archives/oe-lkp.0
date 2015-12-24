Content-Type: multipart/mixed; boundary="===============3398823440217797000=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: lkp@lists.01.org
Subject: Re: [net] ceb5d58b21: -69.2% fsmark.files_per_sec
Date: Thu, 24 Dec 2015 05:17:08 -0800
Message-ID: <CANn89iJxF_qJwk0AmFVd57oexPzeB596KRL0r1HehP23JQM-dw@mail.gmail.com>
In-Reply-To: <87si2sbdky.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3398823440217797000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2015 at 9:49 PM, kernel test robot
<ying.huang@linux.intel.com> wrote:
> FYI, we noticed the below changes on
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit ceb5d58b217098a657f3850b7a2640f995032e62 ("net: fix sock_wake_asyn=
c() rcu protection")
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/filesize/fs2/fs/iterations/kconfig/nr_thre=
ads/rootfs/sync_method/tbox_group/test_size/testcase:
>   gcc-4.9/performance/1BRD_48G/4M/nfsv4/xfs/1x/x86_64-rhel/64t/debian-x86=
_64-2015-02-07.cgz/NoSync/lkp-hsx04/40G/fsmark
>
> commit:
>   9cd3e072b0be17446e37d7414eac8a3499e0601e
>   ceb5d58b217098a657f3850b7a2640f995032e62
>
> 9cd3e072b0be1744 ceb5d58b217098a657f3850b7a
> ---------------- --------------------------
>          %stddev     %change         %stddev

> Thanks,
> Ying Huang

Hi Ying. I have no idea what these confusing numbers mean.

Is your benchmark running faster (good thing) or slower (sorry, but we
fixed a bug)

Thanks.

--===============3398823440217797000==--

