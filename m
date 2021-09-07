Content-Type: multipart/mixed; boundary="===============3342089260919190626=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm/gup] 9857a17f20: kernel_BUG_at_include/linux/pagemap.h
Date: Tue, 07 Sep 2021 11:14:56 -0700
Message-ID: <CAHk-=wh=4TJ3yN0+qpzDPJcH3KFkVsHcHO1FJjKHjaPTx8UCdQ@mail.gmail.com>
In-Reply-To: <20210907153736.GF17617@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3342089260919190626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 7, 2021 at 8:20 AM kernel test robot <oliver.sang@intel.com> =
wrote:
>
> FYI, we noticed the following commit (built with clang-14):
>
> commit: 9857a17f206f ("mm/gup: remove try_get_page(), call try_get_compou=
nd_head() directly")
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
> [  143.908513][ T3260] kernel BUG at include/linux/pagemap.h:223!

Ahh, well, yes.

That commit is clearly buggy, in that the try_get_compound_head() code
really doesn't work at all for us.

__page_cache_add_speculative() is not at all the same as
try_get_page(), and I should have caught on to this as I applied it. I
just read the explanation, and it sounded believable, but it was
entirely wrong.

try_get_page() is literally about that "page ref overflow" case, but
try_get_compound_head() uses page_cache_add_speculative() which has
different logic and has those extra "this only works in RCU context"
logic.

So that commit was completely bogus, and the "lack of maintenance" was
not lack of maintenance at all, it was all about entirely different
semantics.

Reverted.

                 Linus
--===============3342089260919190626==--

