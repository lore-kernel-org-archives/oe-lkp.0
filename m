Content-Type: multipart/mixed; boundary="===============0871232285766419523=="
MIME-Version: 1.0
From: Bart Van Assche <bvanassche@acm.org>
To: lkp@lists.01.org
Subject: Re: [drivers/base] 1431aa42b3: WARNING:at_drivers/base.c:#device_bind_driver
Date: Wed, 07 Nov 2018 18:26:12 -0800
Message-ID: <78791260-c029-4ce8-d44a-61f3a9b392d1@acm.org>
In-Reply-To: <20181108002442.GH24195@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0871232285766419523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/7/18 4:24 PM, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 1431aa42b3afc1dd50b292abcc68ccdc3193da63 ("drivers/base: Verify s=
truct device locking requirements at runtime")
> https://github.com/bvanassche/linux for-next
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu IvyBridge -smp 2 -m =
2G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> [ ... ]

A fix has already been pushed out, so I think this report can be ignored.

Bart.

--===============0871232285766419523==--

