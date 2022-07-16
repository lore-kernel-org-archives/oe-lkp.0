Content-Type: multipart/mixed; boundary="===============3171717405891696129=="
MIME-Version: 1.0
From: Jens Axboe <axboe@kernel.dk>
To: lkp@lists.01.org
Subject: Re: [net] 65a1e5c409: canonical_address#:#[##]
Date: Sat, 16 Jul 2022 08:26:26 -0600
Message-ID: <f7f30927-9f36-ec92-cfdc-cb216115a39f@kernel.dk>
In-Reply-To: <YtLGmrJEJy2pnLaO@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3171717405891696129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/16/22 8:09 AM, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 65a1e5c409f2b56b025f913b9cfbc8ae3a717c9a ("[PATCH v3 for-next 2/3=
] net: copy from user before calling __get_compat_msghdr")
> url: https://github.com/intel-lab-lkp/linux/commits/Dylan-Yudaken/io_urin=
g-multishot-recvmsg/20220714-190504
> patch link: https://lore.kernel.org/io-uring/20220714110258.1336200-3-dyl=
any(a)fb.com
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

This is the same as the issue reported by Marek, should be fixed by:

https://git.kernel.dk/cgit/linux-block/commit/?h=3Dfor-5.20/io_uring&id=3De=
544477ca928416bf3897b8461672752eb6581fe

-- =

Jens Axboe

--===============3171717405891696129==--

