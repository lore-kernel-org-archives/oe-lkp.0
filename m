Content-Type: multipart/mixed; boundary="===============6116131394555915951=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: The result of testing install jobs on CentOS
Date: Mon, 09 Jan 2017 09:16:23 +0800
Message-ID: <8760lpdod4.fsf@yhuang-dev.intel.com>
In-Reply-To: <83D223E0AC87EC438993D009A817895BF628D7@SHSMSX101.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6116131394555915951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"Wu, Chenggang" <chenggang.wu@intel.com> writes:

> After testing the installation, 94 jobs failed to install among all the 1=
69 jobs. The others installed successfully. Among the failed jobs, some may=
 caused by
> the internet connection, and I=E2=80=99ll check those problems. Also amon=
g the succeed jobs, there might be some jobs that didn=E2=80=99t show error=
 clearly so that I can=E2=80=99t
> find out that the result is accually succeeded or failed.
>
> Should I send you the list of the result?

Yes.  Please send me the list of the result.

> For the makepkg part, I succeeded in installing hackbench job with PKGBUI=
LD file on Ubuntu. The result may be also success on CentOS and I=E2=80=99l=
l test it later.
> There are some problems:
>
> 1. If we use the official Archlinux source of PKGBUILD file, the download=
 speed might be very slow. I haven=E2=80=99t find out a way to change the m=
irror source for
> now.

The download speed to download the source code to compile?

> 2. Download and compile every dependency might cost too much time
>
> 3. Should we use the official PKGBUILD file for every dependencies, which=
 may cost a lot of time to download and compile? Or we can get some package=
s from
> apt/yum, however it is hard to find out what packages are exists on apt a=
nd yum.

Yes.  I think we need to get as many packages as possible from apt/yum.
For CentOS or Ubuntu, we only use the standard repository, so the
available packages isn't too many (at least for CentOS).

> Also, I can=E2=80=99t figure out how to use JIRA. Should I comment the re=
sult to the subjects on JIRA?

Yes.  Please add comments for your finding to corresponding JIRA items.

Best Regards,
Huang, Ying

> Best Regards,
>
> Wu Chenggang

--===============6116131394555915951==--

