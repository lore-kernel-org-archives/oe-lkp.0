Content-Type: multipart/mixed; boundary="===============3416825351737706110=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [cfs_trace_lock_tcd] BUG: unable to handle kernel NULL pointer dereference at 00000050
Date: Wed, 18 Apr 2018 22:13:17 +0800
Message-ID: <20180418141317.76o6yzrhjjeavmd7@wfg-t540p.sh.intel.com>
In-Reply-To: <alpine.LFD.2.21.1804181456590.5599@casper.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3416825351737706110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi James,

On Wed, Apr 18, 2018 at 02:59:15PM +0100, James Simmons wrote:
>
>> Hello,
>>
>> FYI this happens in mainline kernel 4.17.0-rc1.
>> It looks like a new regression.
>>
>> [    7.587002]  lnet_selftest_init+0x2c4/0x5d9:
>> 						lnet_selftest_init at drivers/staging/lustre/lnet/selftest/module.=
c:134
>> [    7.587002]  ? lnet_selftest_exit+0x8d/0x8d:
>> 						lnet_selftest_init at drivers/staging/lustre/lnet/selftest/module.=
c:90
>
>Are you running lnet selftest ?

Perhaps yes -- it's randconfig boot test and the .config does include
CONFIG_LNET_SELFTEST:

        CONFIG_LNET=3Dy
        CONFIG_LNET_MAX_PAYLOAD=3D1048576
=3D=3D>     CONFIG_LNET_SELFTEST=3Dy
        CONFIG_LNET_XPRT_IB=3Dy

>Is this a UMP setup?

Yes, .config has:

        # CONFIG_SMP is not set

>The reason I ask is that their is a SMP handling bug in lnet
>selftest. If you look at the mailing list I pushed a SMP patch
>series. Can you try that series and tell me if it works for you.

So it looks your fixup patch is not for this case? Anyway the
reproduce-* script attached in the previous email should be fairly
straightforward to try out for reproducing the bug.

Thanks,
Fengguang

--===============3416825351737706110==--

