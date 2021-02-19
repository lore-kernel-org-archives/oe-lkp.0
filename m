Content-Type: multipart/mixed; boundary="===============1058059654752396180=="
MIME-Version: 1.0
From: Neal Cardwell <ncardwell@google.com>
To: lkp@lists.01.org
Subject: Re: [tcp] 9d9b1ee0b2: packetdrill.packetdrill/gtests/net/tcp/user_timeout/user-timeout-probe_ipv4-mapped-v6.fail
Date: Fri, 19 Feb 2021 09:52:04 -0500
Message-ID: <CADVnQym38g5fjMU-S7fqoRS6sxDjK4y7-9c3XZeGVXjLTN5Xog@mail.gmail.com>
In-Reply-To: <20210219014852.GA16580@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1058059654752396180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 18, 2021 at 8:33 PM kernel test robot <oliver.sang@intel.com>=
 wrote:
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 9d9b1ee0b2d1c9e02b2338c4a4b0a062d2d3edac ("tcp: fix TCP_USER_TIME=
OUT with zero window")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

I have pushed to the packetdrill repo a commit that should fix this test:

094da3bc77e5 (HEAD, packetdrill/master) net-test: update TCP tests for
USER_TIMEOUT ZWP fix
https://github.com/google/packetdrill/commit/094da3bc77e518d820ebc0ef8b94a5=
b4cf707a39

Can someone please pull that commit into the repo used by the test
bot, if needed? (Or does it automatically use the latest packetdrill
master branch?)

thanks,
neal
--===============1058059654752396180==--

