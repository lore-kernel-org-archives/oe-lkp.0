Content-Type: multipart/mixed; boundary="===============8279032140888050288=="
MIME-Version: 1.0
From: Florian Westphal <fw@strlen.de>
To: lkp@lists.01.org
Subject: Re: [rhashtable] 4699858597: RIP: 0010:[<ffffffff81283b16>] [<ffffffff81283b16>] rhashtable_init
Date: Fri, 12 Aug 2016 13:09:45 +0200
Message-ID: <20160812110945.GA25519@breakpoint.cc>
In-Reply-To: <57ada987.FqSw4QeFnftDImTI%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8279032140888050288==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <fengguang.wu@intel.com> wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/0day-ci/linux Florian-Westphal/rhashtable-avoid-large-=
lock-array-allocations/20160812-101458
> =

> commit 4699858597bcd0b212d28c96dad3ffdf18a43c02
> Author:     Florian Westphal <fw@strlen.de>
> AuthorDate: Fri Aug 12 04:13:43 2016 +0200
> Commit:     0day robot <fengguang.wu@intel.com>
> CommitDate: Fri Aug 12 10:15:01 2016 +0800

Yes, problem is

     max_t(unsigned int, 2 * L1_CACHE_BYTES / sizeof(spinlock_t), 1);

Which I took from inet_ehash_locks_alloc().
However, in inet_ehash_locks_alloc this is limited to a branch that
is guarded via

if (sizeof(spinlock_t) !=3D 0) {

Dave already marked v1 'changes requested' in patchwork so no
further action is needed.

--===============8279032140888050288==--

