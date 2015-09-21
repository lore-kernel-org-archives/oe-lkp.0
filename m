Content-Type: multipart/mixed; boundary="===============9066864885891026220=="
MIME-Version: 1.0
From: David Ahern <dsa@cumulusnetworks.com>
To: lkp@lists.01.org
Subject: Re: [net] 192132b9a0: -17.5% netperf.Throughput_tps
Date: Sun, 20 Sep 2015 19:19:04 -0600
Message-ID: <55FF5B08.7010807@cumulusnetworks.com>
In-Reply-To: <87eghtb7e8.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9066864885891026220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/20/15 6:30 AM, kernel test robot wrote:
> FYI, we noticed the below changes on
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 192132b9a034d87566294be0fba5f8f75c2cf16b ("net: Add support for VR=
Fs to inetpeer cache")
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/runtime/nr_t=
hreads/cluster/test:
>    lkp-sbx04/netperf/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/per=
formance/300s/200%/cs-localhost/TCP_CRR
>
> commit:
>    5345c2e12d41f815c1009c9dee72f3d5fcfd4282
>    192132b9a034d87566294be0fba5f8f75c2cf16b
>

Clarification: The reproduce file shows 128 instances of 'netperf -t =

TCP_CRR -c -C -l 300 -H 127.0.0.1' without an '&' on the end. Does that =

mean these 128 commands are run serially?

Also, this is the end patch of a series that first refactors and then =

adds a capability. The more relevant comparison is 8f58336d3f78 to =

192132b9a034 (8f58336d3f78 is the commit before the series). Is it =

possible to get this test run on your system comparing those 2 commits?

Thanks,
David

--===============9066864885891026220==--

