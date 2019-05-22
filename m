Content-Type: multipart/mixed; boundary="===============1095682544973913134=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: 36b74766f2 ("mm: security: introduce init_on_alloc=1 and .."): general protection fault: 0000 [#1] PREEMPT SMP PTI
Date: Wed, 22 May 2019 13:59:38 -0700
Message-ID: <201905221357.3F1F2818@keescook>
In-Reply-To: <CAG_fn=WLq2sh0A5L4=i2AVF=17g92LVnow1HDzDGQG6NK5=rDg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1095682544973913134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 05:26:00PM +0200, Alexander Potapenko wrote:
> No, I believe my analysis is correct.
> I've built the kernel with debug info and saw the same calls of
> kernel_init_free_pages() from memblock_free_pages().
> The call happened from the early_page_uninitialised(pfn) branch, which
> is generally incorrect, as the struct page itself is, well,
> uninitialized.
> As such pages aren't passed to __free_pages_core(), it should be fine
> to skip their initialization.

Ah! I see. I misunderstood what you meant in the other email. Sorry! :)
Sounds like you've got a fix under way. Thanks!

-- =

Kees Cook

--===============1095682544973913134==--

