Content-Type: multipart/mixed; boundary="===============8310757176550801716=="
MIME-Version: 1.0
From: Willem de Bruijn <willemb@google.com>
To: lkp@lists.01.org
Subject: Re: [net] a93417dfc1: kernel-selftests.net.psock_snd.sh.fail
Date: Tue, 16 Jun 2020 17:53:53 -0400
Message-ID: <CA+FuTSdboCXgAicM2TETGQL+LwdTwxKxpDt0GCT9=wAGSL_Yrw@mail.gmail.com>
In-Reply-To: <20200616074319.GK5653@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8310757176550801716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2020 at 3:43 AM kernel test robot <rong.a.chen@intel.com>=
 wrote:
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: a93417dfc1b0e6773fd9cd7e42663c5338a3d826 ("net: check untrusted g=
so_size at kernel entry")
> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable-rc.git l=
inux-5.4.y
>
> in testcase: kernel-selftests
> with following parameters:
>
>         group: kselftests-net
>         ucode: 0xdc
>
> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
>
>
> on test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz with 1=
6G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
>
>
>
>
> # selftests: net: psock_snd.sh
> # dgram
> # tx: 128
> # rx: 142
> # rx: 100
> # OK
> #
> # dgram bind
> # tx: 128
> # rx: 142
> # rx: 100
> # OK
> #
> # raw
> # tx: 142
> # rx: 142
> # rx: 100
> # OK
> #
> # raw bind
> # tx: 142
> # rx: 142
> # rx: 100
> # OK
> #
> # raw qdisc bypass
> # tx: 142
> # rx: 142
> # rx: 100
> # OK
> #
> # raw vlan
> # tx: 146
> # rx: 100
> # OK
> #
> # raw vnet hdr
> # tx: 152
> # rx: 142
> # rx: 100
> # OK
> #
> # raw csum_off
> # tx: 152
> # rx: 142
> # rx: 100
> # OK
> #
> # raw csum_off with bad offset (fails)
> # ./psock_snd: write: Invalid argument
> # raw min size
> # tx: 42
> # rx: 0
> # OK
> #
> # raw mtu size
> # tx: 1514
> # rx: 1472
> # OK
> #
> # raw mtu size + 1 (fails)
> # ./psock_snd: write: Message too long
> # raw vlan mtu size + 1 (fails)
> # ./psock_snd: write: Message too long
> # dgram mtu size
> # tx: 1500
> # rx: 1472
> # OK
> #
> # dgram mtu size + 1 (fails)
> # ./psock_snd: write: Message too long
> # raw truncate hlen (fails: does not arrive)
> # tx: 14
> # ./psock_snd: recv: Resource temporarily unavailable
> # raw truncate hlen - 1 (fails: EINVAL)
> # ./psock_snd: write: Invalid argument
> # raw gso min size
> # ./psock_snd: write: Invalid argument
> not ok 22 selftests: net: psock_snd.sh # exit=3D1

Thanks for the detailed report.

This has been resolved by commit 7c6d2ecbda83 ("net: be more gentle
about silly gso requests coming from user") which has been backported
to linux-stable/5.4.y at 5.4.46 as commit b3ebd9830c60 .
--===============8310757176550801716==--

