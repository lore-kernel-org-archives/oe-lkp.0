Content-Type: multipart/mixed; boundary="===============8039606003027267894=="
MIME-Version: 1.0
From: Miklos Szeredi <mszeredi@suse.cz>
To: lkp@lists.01.org
Subject: Re: [vfs] 662aa027bda: -7.2% will-it-scale.scalability
Date: Tue, 27 May 2014 18:25:39 +0200
Message-ID: <1401207939.5731.12.camel@tucsk.piliscsaba.szeredi.hu>
In-Reply-To: <5384B634.7080902@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8039606003027267894==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2014-05-27 at 23:58 +0800, Jet Chen wrote:
> Hi Miklos,
> =

> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/vfs.git overlayfs.=
v22
> commit 662aa027bdaa082aa3dd21886830c97a1dd4c184 ("vfs: add RENAME_WHITEOU=
T")
> =

> test case: lkp-wsx01/will-it-scale/lseek2

The only thing I see in that commit that could affect performance is the
slightly larger icache footprint of ext4_rename().

Is the regression reproducible across different -rc versions?

Thanks,
Miklos


--===============8039606003027267894==--

