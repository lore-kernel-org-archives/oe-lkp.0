Content-Type: multipart/mixed; boundary="===============0993625706759203127=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [ 53.230885] RIP: 0010:[<ffffffff811b3557>] [<ffffffff811b3557>] qlink_free
Date: Mon, 01 Aug 2016 21:59:47 +0800
Message-ID: <20160801135947.GA24942@wfg-t540p.sh.intel.com>
In-Reply-To: <CAG_fn=W0m8NgJuh2EEbsBr9kdrmkyjtmrxORygfNVsx2VkuQsA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0993625706759203127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

>When I build the kernel with your config and run the script, QEMU
>bails out with an error message:
>  qemu: linux kernel too old to load a ram disk
>Any idea how to work around that?

Yes this config may not include necessary parts. I cannot enter initrd
this way:

[    3.079656] Failed to execute /init (error -8)
[    3.082079] Starting init: /sbin/init exists but couldn't execute it (er=
ror -8)
[    3.084836] Starting init: /etc/init exists but couldn't execute it (err=
or -13)
[    3.088568] Starting init: /bin/sh exists but couldn't execute it (error=
 -8)
[    3.090560] Kernel panic - not syncing: No working init found.  Try pass=
ing init=3D option to kernel. See Linux Documentation/init.txt for guidance.

What's worse, the bug on RIP qlink_free() is only 20% reproducible
in one old boot server. I cannot reproduce that problem in other
more modern machines.

Feel free to ignore it if cannnot find the root cause in call trace.

Thanks,
Fengguang

--===============0993625706759203127==--

