Content-Type: multipart/mixed; boundary="===============5274141778151460314=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/lru] f4ba6c0e1b: vm-scalability.throughput -27.1% regression
Date: Thu, 10 Sep 2020 16:11:40 +0800
Message-ID: <20200910081140.GD26874@shao2-debian>
In-Reply-To: <26519d9c-c7a2-188f-69e9-04678a69f325@linux.alibaba.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5274141778151460314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2020 at 04:05:44PM +0800, Alex Shi wrote:
> =

> =

> =E5=9C=A8 2020/9/10 =E4=B8=8B=E5=8D=883:46, kernel test robot =E5=86=99=
=E9=81=93:
> > Greeting,
> > =

> > FYI, we noticed a -27.1% regression of vm-scalability.throughput due to=
 commit:
> > =

> > =

> > commit: f4ba6c0e1b65b09bafd8efe3a414c6dc1f8ab647 ("mm/lru: replace pgda=
t lru_lock with lruvec lock")
> > https://github.com/alexshi/linux.git lru59
> =

> Hi Rong,
> =

> Thanks a lot!
> =

> Just want to know how much lost on the whole patchset?
> =


The regression is 27%:

        v5.9-rc2  68ee199a9da2f311c818efc0e1  testcase/testparams/testbox
----------------  --------------------------  ---------------------------
         %stddev      change         %stddev
             \          |                \  =

  17195218             -27%   12485310        vm-scalability/performance-30=
0s-lru-file-readtwice-ucode=3D0x2006906-monitor=3De907e467/lkp-skl-fpga01
  17195218             -27%   12485310        GEO-MEAN vm-scalability.throu=
ghput

Best Regards,
Rong Chen
--===============5274141778151460314==--

