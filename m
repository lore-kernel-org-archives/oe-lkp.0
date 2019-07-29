Content-Type: multipart/mixed; boundary="===============2748842279771928007=="
MIME-Version: 1.0
From: Dave Wysochanski <dwysocha@redhat.com>
To: lkp@lists.01.org
Subject: Re: [SUNRPC] 661ccd4df3: ltp.proc01.fail
Date: Mon, 29 Jul 2019 09:40:57 -0400
Message-ID: <ee309a53cd55517886691c36152044a630da391c.camel@redhat.com>
In-Reply-To: <20190729095353.GS22106@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2748842279771928007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-07-29 at 17:53 +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 661ccd4df38fdcddfeb1f314ac1a1de6c947c3f9 ("[RFC PATCH]
> SUNRPC: Harden the cache 'channel' interface to only allow legitimate
> daemons")
> url: =

> https://github.com/0day-ci/linux/commits/Dave-Wysochanski/SUNRPC-Harden-t=
he-cache-channel-interface-to-only-allow-legitimate-daemons/20190727-042349
> base: git://linux-nfs.org/~bfields/linux.git nfsd-next
> =


This patch is no good and should be NACKd.

Bruce, Neil please consider alternative patch:
[RFC PATCH] SUNRPC: Track writers of the 'channel' file to improve cache_li=
steners_exist


Thanks.




--===============2748842279771928007==--

