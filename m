Content-Type: multipart/mixed; boundary="===============8999932129925210868=="
MIME-Version: 1.0
From: John Hubbard <jhubbard@nvidia.com>
To: lkp@lists.01.org
Subject: Re: [mm/gup] 9857a17f20: kernel_BUG_at_include/linux/pagemap.h
Date: Tue, 07 Sep 2021 12:10:51 -0700
Message-ID: <513d8734-7156-f3b6-b149-4d2cd83b5742@nvidia.com>
In-Reply-To: <CAHk-=wh=4TJ3yN0+qpzDPJcH3KFkVsHcHO1FJjKHjaPTx8UCdQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8999932129925210868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/7/21 11:14 AM, Linus Torvalds wrote:
> On Tue, Sep 7, 2021 at 8:20 AM kernel test robot <oliver.sang@intel.com=
> wrote:
>>
>> FYI, we noticed the following commit (built with clang-14):
>>
>> commit: 9857a17f206f ("mm/gup: remove try_get_page(), call try_get_compo=
und_head() directly")
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>> [  143.908513][ T3260] kernel BUG at include/linux/pagemap.h:223!
> =

> Ahh, well, yes.
> =

> That commit is clearly buggy, in that the try_get_compound_head() code
> really doesn't work at all for us.
> =

> __page_cache_add_speculative() is not at all the same as
> try_get_page(), and I should have caught on to this as I applied it. I
> just read the explanation, and it sounded believable, but it was
> entirely wrong.
> =

> try_get_page() is literally about that "page ref overflow" case, but
> try_get_compound_head() uses page_cache_add_speculative() which has
> different logic and has those extra "this only works in RCU context"
> logic.
> =

> So that commit was completely bogus, and the "lack of maintenance" was
> not lack of maintenance at all, it was all about entirely different
> semantics.
> =

> Reverted.
> =

>                   Linus

Apologies for the bug! There is a lesson in here, somewhere...


thanks,
-- =

John Hubbard
NVIDIA
--===============8999932129925210868==--

