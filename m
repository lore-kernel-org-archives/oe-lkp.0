Content-Type: multipart/mixed; boundary="===============8586441781466018389=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: 5b4ed50902 ("sched/fair: Fix wake_affine() for !NUMA_BALANCING"): BUG: unable to handle kernel paging request at ffffffffffffff80
Date: Fri, 11 Aug 2017 16:57:40 +0200
Message-ID: <20170811145740.7dlfpfqynwnmpwvo@hirez.programming.kicks-ass.net>
In-Reply-To: <20170811031016.rnszkji6azgx5iij@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8586441781466018389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2017 at 11:10:16AM +0800, Fengguang Wu wrote:
> Yeah, I find that too when trying to reproduce it by hand. The
> packages in the build server were installed long ago and seems no
> longer exist in current Debian repository.

You can add the jessie repo and force install them from there. Just be
sure to either remove the repo when you've installed them or teach apt
to never take packages from there unless forced.

--===============8586441781466018389==--

