Content-Type: multipart/mixed; boundary="===============5317612417408917937=="
MIME-Version: 1.0
From: Xin Long <lucien.xin@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sctp] a6c2f79287: netperf.Throughput_Mbps -37.2% regression
Date: Wed, 17 Aug 2016 02:34:46 +0800
Message-ID: <CADvbK_cEo59Num286+7BoOkNgiScq7wjHvKM_FAx6qsQjACTXA@mail.gmail.com>
In-Reply-To: <6e529b10-117d-8af0-66b3-2ccfb71acf2a@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5317612417408917937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>
> And I think we should be doing test on:
> commit a6c2f79287 ("sctp: implement prsctp TTL policy") (the bisected one)
> and
> commit 826d253d57 ("sctp: add SCTP_PR_ASSOC_STATUS on sctp sockopt") (its=
 immediate parent)
> instead of Linus' master HEAD to avoid other factors.
>
The test result shows they are almost same:

826d253d57
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[root(a)localhost lxin]# sysctl -w net.sctp.prsctp_enable=3D1
net.sctp.prsctp_enable =3D 1
15484.93
15557.69
15395.61

[root(a)localhost lxin]# sysctl -w net.sctp.prsctp_enable=3D0
net.sctp.prsctp_enable =3D 0
15369.83
14419.81
15202.59


a6c2f79287
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[root(a)localhost lxin]# sysctl -w net.sctp.prsctp_enable=3D1
net.sctp.prsctp_enable =3D 1
15198.00
15567.87
16092.55

[root(a)localhost lxin]# sysctl -w net.sctp.prsctp_enable=3D0
net.sctp.prsctp_enable =3D 0
15624.70
15021.85
15390.62

You can also review the commit a6c2f79287 if you have time:

It just added some 'if()' in the sending path if we don't use
any policy . In our test, no policy was used, I even added
log in kernel to check if some unexpected policy is enabled.

But still no.

If you can reproduce this issue stably, I suggest you can reverse
some code of that patch (it's a really a small patch)  and re-build
the kernel, then try.
With that, you can locate which line exactly triggered this issue.

Thanks.

--===============5317612417408917937==--

