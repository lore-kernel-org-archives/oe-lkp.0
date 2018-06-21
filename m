Content-Type: multipart/mixed; boundary="===============7879796152665878421=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [Kbuild] 050e9baa9d: netperf.Throughput_total_tps -5.6% regression (FYI)
Date: Thu, 21 Jun 2018 17:37:23 +0900
Message-ID: <CA+55aFywQwJDAu6tdouAung+wHxRAWS7Rj8KhtMtHC=NGbF7rw@mail.gmail.com>
In-Reply-To: <87muvoh7fy.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7879796152665878421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 21, 2018 at 5:25 PM Huang, Ying <ying.huang@intel.com> wrote:
> Do you have interest in some other comparison?

No, I think the overhead of the strong stackprotector is a bit sad,
but I assume it's because of the nasty code to load the stack canary
from a cacheline that has absolutely nothing else in it.

Oh well.

          Linus

--===============7879796152665878421==--

