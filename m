Content-Type: multipart/mixed; boundary="===============3021057629975029902=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: 867853145c: BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Mon, 23 May 2016 22:18:59 +0800
Message-ID: <20160523141859.GA24123@wfg-t540p.sh.intel.com>
In-Reply-To: <20160523141135.GA23589@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3021057629975029902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Bisect log shows another interesting fact: after enabling
> CONFIG_DEBUG_INFO, the error goes away.

Sorry it only enables CONFIG_DEBUG_INFO_REDUCED.

> # extra tests with DEBUG_INFO
> git bisect good 867853145cea25491054ef067ff8af8946f37e2d  # 05:36     66+=
      0  Merge branch 'kbuild/kbuild' into kbuild/for-next
 =

Thanks,
Fengguang

--===============3021057629975029902==--

