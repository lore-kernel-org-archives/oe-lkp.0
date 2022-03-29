Content-Type: multipart/mixed; boundary="===============0169363815554149279=="
MIME-Version: 1.0
From: David Ahern <dsahern@kernel.org>
To: lkp@lists.01.org
Subject: Re: [net] 40867d74c3: kernel-selftests.net.vrf-xfrm-tests.sh.No_qdisc_on_VRF_device.IPv6_xfrm_policy_based_on_address.fail
Date: Mon, 28 Mar 2022 20:28:55 -0600
Message-ID: <04f0281c-7173-6a37-f573-b28f7a30f414@kernel.org>
In-Reply-To: <20220327141424.GD32190@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0169363815554149279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/27/22 8:14 AM, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 40867d74c374b235e14d839f3a77f26684feefe5 ("net: Add l3mdev index =
to flow struct and avoid oif reset for port devices")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =


Thanks for the report. I have a fix under test; will go out this week.

--===============0169363815554149279==--

