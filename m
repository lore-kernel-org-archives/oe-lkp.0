Content-Type: multipart/mixed; boundary="===============1309989944838557728=="
MIME-Version: 1.0
From: Florian Westphal <fw@strlen.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [test_rhashtable] c1bd3689a7: WARNING:at_lib/debugobjects.c:#__debug_object_init
Date: Wed, 20 Sep 2017 10:44:28 +0200
Message-ID: <20170920084428.GA15946@breakpoint.cc>
In-Reply-To: <20170920015457.GA30213@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1309989944838557728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <xiaolong.ye@intel.com> wrote:
> FYI, we noticed the following commit:
> =

> commit: c1bd3689a70d1ba1a2f7c6781770920087166018 ("test_rhashtable: add t=
est case for rhl_table interface")
> url: https://github.com/0day-ci/linux/commits/Florian-Westphal/test_rhash=
table-add-test-case-for-rhl-table/20170919-135550
> =

> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -smp 2 -m 512M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +---------------------------------------------------------+------------+-=
-----------+
> [   15.235031] WARNING: CPU: 0 PID: 1 at lib/debugobjects.c:328 __debug_o=
bject_init+0x794/0x930
[..]

This is with v1 of the patch where the rhltable struct was allocated on
stack, v2 is fine.


--===============1309989944838557728==--

