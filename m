Content-Type: multipart/mixed; boundary="===============0680569143045698991=="
MIME-Version: 1.0
From: Johannes Berg <johannes@sipsolutions.net>
To: lkp@lists.01.org
Subject: Re: f77477b162: hwsim.ap_open_multicast_to_unicast.fail
Date: Wed, 17 Oct 2018 15:40:29 +0200
Message-ID: <4645ed5a5edaafcca94b1483212f9a70f45cf36f.camel@sipsolutions.net>
In-Reply-To: <20181017055345.GD16117@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0680569143045698991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-10-17 at 13:53 +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: f77477b1624c0ac20c0c85c8b529da48686ab54d ("[PATCH] New functional=
ity for aborting ongoing CAC.")
> url: https://github.com/0day-ci/linux/commits/Enrique-Giraldo/New-functio=
nality-for-aborting-ongoing-CAC/20180925-181417
> base: https://git.kernel.org/cgit/linux/kernel/git/jberg/mac80211-next.gi=
t master
> =

> in testcase: hwsim
> with following parameters:
> =

> 	group: hwsim-01

Yeah, this patch completely broke the nl80211 API :-)

johannes


--===============0680569143045698991==--

