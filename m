Content-Type: multipart/mixed; boundary="===============0529479539198792975=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm/gup] 57efa1fe59: will-it-scale.per_thread_ops -9.2% regression
Date: Mon, 24 May 2021 17:11:37 -1000
Message-ID: <CAHk-=whTEC_GVYu=WfvUagNvHdoTALEDg8uqK3V6aMDwg2KMRA@mail.gmail.com>
In-Reply-To: <20210525031636.GB7744@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0529479539198792975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 24, 2021 at 5:00 PM kernel test robot <oliver.sang@intel.com>=
 wrote:
>
> FYI, we noticed a -9.2% regression of will-it-scale.per_thread_ops due to=
 commit:
> commit: 57efa1fe5957694fa541c9062de0a127f0b9acb0 ("mm/gup: prevent gup_fa=
st from racing with COW during fork")

Hmm. This looks like one of those "random fluctuations" things.

It would be good to hear if other test-cases also bisect to the same
thing, but this report already says:

> In addition to that, the commit also has significant impact on the follow=
ing tests:
>
> +------------------+-----------------------------------------------------=
----------------------------+
> | testcase: change | will-it-scale: will-it-scale.per_thread_ops 3.7% imp=
rovement                    |

which does kind of reinforce that "this benchmark gives unstable numbers".

The perf data doesn't even mention any of the GUP paths, and on the
pure fork path the biggest impact would be:

 (a) maybe "struct mm_struct" changed in size or had a different cache layo=
ut

 (b) two added (nonatomic) increment operations in the fork path due
to the seqcount

and I'm not seeing what would cause that 9% change. Obviously cache
placement has done it before.

If somebody else sees something that I'm missing, please holler. But
I'll ignore this as "noise" otherwise.

            Linus
--===============0529479539198792975==--

