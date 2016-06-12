Content-Type: multipart/mixed; boundary="===============2493776802617534365=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] 5c0a85fad9: unixbench.score -6.3% regression
Date: Sat, 11 Jun 2016 18:02:57 -0700
Message-ID: <CA+55aFy4oYis6HTu7o4YwiFawRtDOPO=87v8oHZdTFS+BjnA8g@mail.gmail.com>
In-Reply-To: <87porn44fm.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2493776802617534365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 11, 2016 at 5:49 PM, Huang, Ying <ying.huang@intel.com> wrote:
>
> From perf profile, the time spent in page_fault and its children
> functions are almost same (7.85% vs 7.81%).  So the time spent in page
> fault and page table operation itself doesn't changed much.  So, you
> mean CPU may be slower to load the page table entry to TLB if accessed
> bit is not set?

So the CPU does take a microfault internally when it needs to set the
accessed/dirty bit. It's not architecturally visible, but you can see
it when you do timing loops.

I've timed it at over a thousand cycles on at least some CPU's, but
that's still peanuts compared to a real page fault. It shouldn't be
*that* noticeable, ie no way it's a 6% regression on its own.

           Linus

--===============2493776802617534365==--

