Content-Type: multipart/mixed; boundary="===============6065814630038445569=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [printk] 7f7c60e066: BUG:KASAN:slab-out-of-bounds
Date: Mon, 30 Oct 2017 17:14:59 -0700
Message-ID: <CAGXu5jJ+oVhroQHcbbiKERqYQXmoMtsmP_QuQwJX9TdAOdtYvQ@mail.gmail.com>
In-Reply-To: <20171025162213.GH3294@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6065814630038445569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2017 at 9:22 AM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit (built with gcc-4.9):
>
> commit: 7f7c60e0663645e757e520245606fde9c6e326bb ("printk: hash addresses=
 printed with %p")
> url: https://github.com/0day-ci/linux/commits/Tobin-C-Harding/printk-hash=
-addresses-printed-with-p/20171024-231922

It's not clear to me which of the various versions this test ran
against, but it seems like the printf self-tests got very confused by
the results:

> [   40.275423] test_printf: kvasprintf(..., "%p %p", ...) returned '3cf9a=
dbe eff717bf', expected '0000000001234567 fffffffffedcba98'
> [   40.296739] test_printf: vsnprintf(buf, 256, "|%-*p|%*p|", ...) return=
ed 19, expected 39
> [   40.322776] test_printf: vsnprintf(buf, 16, "|%-*p|%*p|", ...) returne=
d 19, expected 39
> [   40.334834] test_printf: vsnprintf(buf, 0, "|%-*p|%*p|", ...) returned=
 19, expected 39

I assume v10 will fix the width issues, but probably not the value tests...

And it claims a use-after-free, too:

> [   39.757461] The buggy address belongs to the object at 22cb34bb
> [   39.757461]  which belongs to the cache kmalloc-32 of size 32
> [   39.757461] The buggy address is located 0 bytes inside of
> [   39.757461]  32-byte region [22cb34bb, 24ac3a60)

Which becomes rather unreadable, since the address got hashed. :P

-Kees

-- =

Kees Cook
Pixel Security

--===============6065814630038445569==--

