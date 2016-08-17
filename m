Content-Type: multipart/mixed; boundary="===============8647549234728365110=="
MIME-Version: 1.0
From: Xin Long <lucien.xin@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sctp] a6c2f79287: netperf.Throughput_Mbps -37.2% regression
Date: Wed, 17 Aug 2016 13:34:37 +0800
Message-ID: <CADvbK_cfoegUKHEtPgyowjE3ctb3X8878cV4JJyvkjSaeBu6ug@mail.gmail.com>
In-Reply-To: <47965feb-3a4d-4e07-a9ed-86a3d58fb911@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8647549234728365110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>
> For commit a6c2f79287 ("sctp: implement prsctp TTL policy"), no matter
> the value of net.sctp.prsctp_enable, the throughput is almost the same:
>
> net.sctp.prsctp_enable =3D 0
> {
>   "netperf.Throughput_Mbps": [
>     2353.3112499999997
>   ]
> }
>
> net.sctp.prsctp_enable =3D 1
> {
>   "netperf.Throughput_Mbps": [
>     2371.5862500000003
>   ]
> }
>
> For its immediate parent:
> commit 826d253d57 ("sctp: add SCTP_PR_ASSOC_STATUS on sctp sockopt")
> No matter the value of net.sctp.prsctp_enable, the throughput is again
> almost the same:
>
> net.sctp.prsctp_enable =3D 0
> {
>   "netperf.Throughput_Mbps": [
>     3838.8300000000004
>   ]
> }
>
> net.sctp.prsctp_enable =3D 1
> {
>   "netperf.Throughput_Mbps": [
>     3751.4600000000005
>   ]
> }
>
> Does this result give any hint?
OK, if you disable prsctp_enable, commit a6c2f79287 really only adds
two if (), which definitely can't affect performance.

if it's really an issue, pls help to reverse the codes from commit a6c2f792=
87
little by little, rebuild kernel and try.  you will find which line
exactly caused
the performance issue.  it seems the only way to locate the issue, yet it's
only reproducable in your env.

Thanks.

--===============8647549234728365110==--

