Content-Type: multipart/mixed; boundary="===============7137578930310686119=="
MIME-Version: 1.0
From: Dmitry Safonov <dima@arista.com>
To: lkp@lists.01.org
Subject: Re: 7acf9d4237 BUG: kernel hang in test stage
Date: Mon, 30 Jul 2018 14:08:45 +0100
Message-ID: <1532956125.2679.28.camel@arista.com>
In-Reply-To: <20180730081219.GC30690@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7137578930310686119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for the report, looking into this..

On Mon, 2018-07-30 at 16:12 +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad
> commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git master
> =

> commit 7acf9d4237c46894e0fa0492dd96314a41742e84
> Author:     Dmitry Safonov <dima@arista.com>
> AuthorDate: Fri Jul 27 16:54:44 2018 +0100
> Commit:     David S. Miller <davem@davemloft.net>
> CommitDate: Sun Jul 29 12:50:19 2018 -0700
> =

>     netlink: Do not subscribe to non-existent groups
>     =

>     Make ABI more strict about subscribing to group > ngroups.
>     Code doesn't check for that and it looks bogus.
>     (one can subscribe to non-existing group)
>     Still, it's possible to bind() to all possible groups with (-1)
>     =

>     Cc: "David S. Miller" <davem@davemloft.net>
>     Cc: Herbert Xu <herbert@gondor.apana.org.au>
>     Cc: Steffen Klassert <steffen.klassert@secunet.com>
>     Cc: netdev(a)vger.kernel.org
>     Signed-off-by: Dmitry Safonov <dima@arista.com>
>     Signed-off-by: David S. Miller <davem@davemloft.net>
> =

> 9939a46d90  NET: stmmac: align DMA stuff to largest cache line length
> 7acf9d4237  netlink: Do not subscribe to non-existent groups
> 25432eba9c  openvswitch: meter: Fix setting meter id for new entries
> +--------------------------------------------------+------------+--
> ----------+------------+
> >                                                  | 9939a46d90 |
> > 7acf9d4237 | 25432eba9c |
> =

> +--------------------------------------------------+------------+--
> ----------+------------+
> > boot_successes                                   | 20         |
> > 4          | 4          |
> > boot_failures                                    | 22         |
> > 11         | 11         |
> > INFO:task_blocked_for_more_than#seconds          |
> > 22         |            |            |
> > Kernel_panic-not_syncing:hung_task:blocked_tasks |
> > 22         |            |            |
> > BUG:kernel_hang_in_test_stage                    | 0          |
> > 11         | 11         |
> =

> +--------------------------------------------------+------------+--
> ----------+------------+
> =

> [ 1414.113020] Writes:  Total: 373492244  Max/Min: 0/0   Fail: 0 =

> [ 1472.149785] CE: Reprogramming failure. Giving up
> [ 1475.552294] Writes:  Total: 387526813  Max/Min: 0/0   Fail: 0 =

> [ 1509.501097] CE: Reprogramming failure. Giving up
> [ 1536.992336] Writes:  Total: 403788741  Max/Min: 0/0   Fail: 0 =

> BUG: kernel hang in test stage
> =

> =

>                                                           # HH:MM
> RESULT GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 0a930dcfc77cb12bbf9bffd69fbadcb0c237f577
> d72e90f33aa4709ebecc5005562f52335e106a60 --
> git bisect  bad f605359102be537b6217dc49600f4369d1f04932  #
> 07:19  B      0    11   27   0  Merge 'm68k/master' into devel-
> catchup-201807300507
> git bisect  bad 375347c493a490f493fafa02f30fa23179acbdb9  #
> 07:53  B      0    11   27   0  Merge 'linux-review/Todd-
> Poynor/staging-gasket-fixes-and-cleanups/20180730-034316' into devel-
> catchup-201807300507
> git bisect good 86b34080126c3f4254a3f9e8d5dcb447d9233bc8  #
> 08:05  G     11     0    6   6  0day base guard for 'devel-catchup-
> 201807300507'
> git bisect  bad ed28433e6f289d33dd6b4bbf627a60396234db58  #
> 08:40  B      0     1   17   0  Merge 'net/master' into devel-
> catchup-201807300507
> git bisect good 5b891af7fca14526b2a87c6f38b004e2df655ef4  #
> 08:54  G     11     0   11  11  bpf: Replace [u]int32_t and
> [u]int64_t in libbpf
> git bisect good c259b4fb33ee6e7667bf1d34bf0803b7c5fdbdce  #
> 09:03  G     10     0    3   3  netdevsim: don't leak devlink
> resources
> git bisect good b0753408aadf32c7ece9e6b765017881e54af833  #
> 09:17  G     11     0    3   3  net: mdio-mux: bcm-iproc: fix wrong
> getter and setter pair
> git bisect good 71eb5255f55bdb484d35ff7c9a1803f453dfbf82  #
> 09:25  G     11     0   11  11  bpf: use GFP_ATOMIC instead of
> GFP_KERNEL in bpf_parse_prog()
> git bisect good 6d27c6dd1012e7be748ec05da78556319718fbe7  #
> 09:39  G     11     0    4   4  Merge branch 'net-socket-Fix-
> potential-spectre-v1-gadgets'
> git bisect good 9939a46d90c6c76f4533d534dbadfa7b39dc6acc  #
> 09:55  G     11     0    7   7  NET: stmmac: align DMA stuff to
> largest cache line length
> git bisect  bad 25432eba9cd8f2ef5afef55be811b010a004b5fa  #
> 10:28  B      0    11   27   0  openvswitch: meter: Fix setting meter
> id for new entries
> git bisect  bad 7acf9d4237c46894e0fa0492dd96314a41742e84  #
> 11:03  B      0     6   22   0  netlink: Do not subscribe to non-
> existent groups
> # first bad commit: [7acf9d4237c46894e0fa0492dd96314a41742e84]
> netlink: Do not subscribe to non-existent groups
> git bisect good 9939a46d90c6c76f4533d534dbadfa7b39dc6acc  #
> 11:14  G     31     0   15  22  NET: stmmac: align DMA stuff to
> largest cache line length
> # extra tests with debug options
> git bisect  bad 7acf9d4237c46894e0fa0492dd96314a41742e84  #
> 11:48  B      0    11   27   0  netlink: Do not subscribe to non-
> existent groups
> # extra tests on HEAD of linux-devel/devel-catchup-201807300507
> git bisect  bad 0a930dcfc77cb12bbf9bffd69fbadcb0c237f577  #
> 11:49  B      0    13   31   0  0day head guard for 'devel-catchup-
> 201807300507'
> # extra tests on tree/branch net/master
> git bisect  bad 25432eba9cd8f2ef5afef55be811b010a004b5fa  #
> 11:50  B      0    11   27   0  openvswitch: meter: Fix setting meter
> id for new entries
> # extra tests with first bad commit reverted
> git bisect good e61543e57747e8fd80390af39504365a392cef2b  #
> 12:04  G     11     0    4   4  Revert "netlink: Do not subscribe to
> non-existent groups"
> =

> ---
> 0-DAY kernel test infrastructure                Open Source
> Technology Center
> https://lists.01.org/pipermail/lkp                          Intel
> Corporation

--===============7137578930310686119==--

