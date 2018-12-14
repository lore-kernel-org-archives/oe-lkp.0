Content-Type: multipart/mixed; boundary="===============8003517243857801082=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [xarray] 93eb07f72c: RIP:__sanitizer_cov_trace_pc
Date: Fri, 14 Dec 2018 05:50:01 -0800
Message-ID: <20181214135000.GA10600@bombadil.infradead.org>
In-Reply-To: <20181214083136.GB23332@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8003517243857801082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 14, 2018 at 04:31:36PM +0800, kernel test robot wrote:
> initrds=3D(
> 	/osimage/quantal/quantal-core-x86_64-2018-11-09.cgz
> 	/lkp/lkp/lkp-x86_64.cgz
> 	/osimage/pkg/debian-x86_64-2016-08-31.cgz/trinity-static-x86_64-x86_64-6=
ddabfd2_2017-11-10.cgz
> )
> =

> HTTP_PREFIX=3Dhttps://download.01.org/0day-ci/lkp-qemu
> wget --timestamping "${initrds[@]/#/$HTTP_PREFIX}"

I love that you're providing this service, but seriously, this is the
third report in a row that's just wrong.

--2018-12-14 08:48:21--  https://download.01.org/0day-ci/lkp-qemu/osimage/q=
uantal/quantal-core-x86_64-2018-11-09.cgz
Resolving download.01.org (download.01.org)... 104.90.64.218, 2600:1408:300=
0:28b::ae6, 2600:1408:3000:291::ae6
Connecting to download.01.org (download.01.org)|104.90.64.218|:443... conne=
cted.
HTTP request sent, awaiting response... 404 Not Found
2018-12-14 08:48:21 ERROR 404: Not Found.

--2018-12-14 08:48:21--  https://download.01.org/0day-ci/lkp-qemu/lkp/lkp/l=
kp-x86_64.cgz
Reusing existing connection to download.01.org:443.
HTTP request sent, awaiting response... 404 Not Found
2018-12-14 08:48:21 ERROR 404: Not Found.



--===============8003517243857801082==--

