Content-Type: multipart/mixed; boundary="===============3666232719735442842=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: WARNING: stack going in the wrong direction? ip=__schedule+0x489/0x830
Date: Thu, 19 Apr 2018 13:58:03 +0800
Message-ID: <20180419055803.ty5nxeb36qwoywi7@wfg-t540p.sh.intel.com>
In-Reply-To: <20180419054941.hpmfbyybqhlscghh@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3666232719735442842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 19, 2018 at 01:49:41PM +0800, Fengguang Wu wrote:
>Hello,
>
>FYI this warning dates back to v4.16-rc5 .

>It's rather rare and often happen together with other errors.

Sorry, that should be 0day didn't catch this particular WARNING.
So it just occasionally show up in the context of other errors.

I jut added that WARNING pattern to 0day and hope we can get more
information about it.

Thanks,
Fengguang

--===============3666232719735442842==--

