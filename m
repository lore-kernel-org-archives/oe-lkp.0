Content-Type: multipart/mixed; boundary="===============1958127826326751847=="
MIME-Version: 1.0
From: James Simmons <jsimmons@infradead.org>
To: lkp@lists.01.org
Subject: Re: [cfs_trace_lock_tcd] BUG: unable to handle kernel NULL pointer dereference at 00000050
Date: Wed, 18 Apr 2018 14:59:15 +0100
Message-ID: <alpine.LFD.2.21.1804181456590.5599@casper.infradead.org>
In-Reply-To: <20180418133831.uef7d77ejdyjtxgh@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1958127826326751847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> Hello,
> =

> FYI this happens in mainline kernel 4.17.0-rc1.
> It looks like a new regression.
> =

> [    7.587002]  lnet_selftest_init+0x2c4/0x5d9:
> 						lnet_selftest_init at drivers/staging/lustre/lnet/selftest/module.c=
:134
> [    7.587002]  ? lnet_selftest_exit+0x8d/0x8d:
> 						lnet_selftest_init at drivers/staging/lustre/lnet/selftest/module.c=
:90

Are you running lnet selftest ? Is this a UMP setup? The reason I ask is
that their is a SMP handling bug in lnet selftest. If you look at the
mailing list I pushed a SMP patch series. Can you try that series and
tell me if it works for you. Thanks

--===============1958127826326751847==--

