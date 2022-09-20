Content-Type: multipart/mixed; boundary="===============6467789785905269982=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: lkp@lists.01.org
Subject: Re: [tcp] 4bfe744ff1: packetdrill.packetdrill/gtests/net/tcp/epoll/epoll_out_edge_default_notsent_lowat_ipv4-mapped-v6.fail
Date: Tue, 20 Sep 2022 08:59:48 -0700
Message-ID: <CANn89iJn554zCtkG9d556kgC4010yfgc4X+GAnoQQW+5Z_sNpg@mail.gmail.com>
In-Reply-To: <202209201359.3f33d97f-oliver.sang@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6467789785905269982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 19, 2022 at 10:22 PM kernel test robot
<oliver.sang@intel.com> wrote:
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-11):
>
> commit: 4bfe744ff1644fbc0a991a2677dc874475dd6776 ("tcp: fix potential xmi=
t stalls caused by TCP_NOTSENT_LOWAT")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> in testcase: packetdrill
> version: packetdrill-x86_64-329d89e-1_20220824
> with following parameters:
>
>
>
> on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-7700 CPU @ 3.60=
GHz (Kaby Lake) with 32G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Link: https://lore.kernel.org/r/202209201359.3f33d97f-oliver.sang(a)int=
el.com
>
>
> we actually also observed other tests failed on this commit but pass on p=
arent:
> (more details are in attached dmesg and 'packetdrill' file)
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> tbox_group/testcase/rootfs/kconfig/compiler:
>   lkp-kbl-d01/packetdrill/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3=
-func/gcc-11
>
> 1fcb8fb3522f5b0f 4bfe744ff1644fbc0a991a2677d
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :30         100%          30:30    packetdrill.packetdrill/gte=
sts/net/tcp/epoll/epoll_out_edge_default_notsent_lowat_ipv4-mapped-v6.fail
>            :30         100%          30:30    packetdrill.packetdrill/gte=
sts/net/tcp/epoll/epoll_out_edge_default_notsent_lowat_ipv4.fail
>            :30         100%          30:30    packetdrill.packetdrill/gte=
sts/net/tcp/epoll/epoll_out_edge_ipv4-mapped-v6.fail
>            :30         100%          30:30    packetdrill.packetdrill/gte=
sts/net/tcp/epoll/epoll_out_edge_ipv4.fail
>            :30         100%          30:30    packetdrill.packetdrill/gte=
sts/net/tcp/epoll/epoll_out_edge_notsent_lowat_ipv4-mapped-v6.fail
>            :30         100%          30:30    packetdrill.packetdrill/gte=
sts/net/tcp/epoll/epoll_out_edge_notsent_lowat_ipv4.fail
>
>
> stdout:
> stderr:
> FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/epoll/epoll_out_edge.pkt=
 (ipv4)]
> stdout:
> stderr:
> FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/epoll/epoll_out_edge_def=
ault_notsent_lowat.pkt (ipv4-mapped-v6)]
>
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         sudo bin/lkp install job.yaml           # job file is attached in=
 this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file =
for lkp run
>         sudo bin/lkp run generated-yaml-file
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
>
>

Sure, these (out of tree) packetdrill tests need to account for the
new kernel behavior.

I am not sure who is responsible for these tests, but this is not the
kernel maintainers.
--===============6467789785905269982==--

