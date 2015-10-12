Content-Type: multipart/mixed; boundary="===============6794219138972128929=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [string] 5f6f0801f5: BUG: KASan: out of bounds access in strlcpy+0xc8/0x250 at addr ffff88011a666ee0
Date: Mon, 12 Oct 2015 15:43:19 +0800
Message-ID: <87y4f88rc8.fsf@yhuang-dev.intel.com>
In-Reply-To: <20151012073355.GA16543@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6794219138972128929==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ingo Molnar <mingo@kernel.org> writes:

> * kernel test robot <ying.huang@linux.intel.com> wrote:
>
>> FYI, we noticed the below changes on
>> =

>> git://internal_mailing_list_patch_tree Ingo-Molnar/string-Improve-the-ge=
neric-strlcpy-implementation
>> commit 5f6f0801f5fdfce4984c6a14f99dbfbb417acb66 ("string: Improve the ge=
neric strlcpy() implementation")
>
> Hm, there's no such commit ID anywhere I can see - did you rebase my tree=
 perhaps?

The test is for patch from LKML instead of git tree.  That is, you patch
is tested via applying it to a -rc kernel.

Do you have a commit in your tree for this?  We can test that to confirm.

> I am guessing that you rebased the attached WIP commit I have in -tip (no=
t =

> permanently committed), which bases strlcpy() off strscpy() and through w=
hich =

> strscpy() gains a couple of hundred usage sites:
>
> +size_t strlcpy(char *dst, const char *src, size_t dst_size)
> +{
> +	int ret =3D strscpy(dst, src, dst_size);
> +
> +	/* Handle the insane and broken strlcpy() overflow return value: */
> +	if (ret < 0)
> +		return dst_size + strlen(src+dst_size);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(strlcpy);
>
> Now depending on what tree you tested it on, this KASAN report might eith=
er be a =

> known and meanwhile strscpy() bug - or might perhaps be something new!
>
> The old, known fix is:
>
>   990486c8af04 strscpy: zero any trailing garbage bytes in the destination
>
>> [   22.205482] systemd[1]: RTC configured in localtime, applying delta o=
f 480 minutes to system time.
>> [   22.214569] random: systemd urandom read with 11 bits of entropy avai=
lable
>> [   22.241378] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [   22.242067] BUG: KASan: out of bounds access in strlcpy+0xc8/0x250 at=
 addr ffff88011a666ee0
>> [   22.242067] Read of size 8 by task systemd/1
>> [   22.242067] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>> [   22.242067] BUG kmalloc-64 (Not tainted): kasan: bad access detected
>> [   22.242067] ---------------------------------------------------------=
--------------------
>> [   22.242067] =

>> [   22.242067] Disabling lock debugging due to kernel taint
>> [   22.242067] INFO: Slab 0xffffea0004699980 objects=3D64 used=3D64 fp=
=3D0x          (null) flags=3D0x200000000000080
>> [   22.242067] INFO: Object 0xffff88011a666ec0 @offset=3D3776 fp=3D0x737=
9732f62696c2f
>> [   22.242067] =

>> [   22.242067] Bytes b4 ffff88011a666eb0: 00 00 00 00 00 00 00 00 a7 4b =
c2 ef 07 00 00 00  .........K......
>> [   22.242067] Object ffff88011a666ec0: 2f 6c 69 62 2f 73 79 73 74 65 6d=
 64 2f 73 79 73  /lib/systemd/sys
>
> Is there any stack trace of this bad access?

There is dmesg file attached in the original report email.  The stack
trace is as follow,

[   22.242067] Call Trace:
[   22.242067]  [<ffffffff8176e231>] dump_stack+0x4e/0x7d
[   22.242067]  [<ffffffff81203c18>] print_trailer+0xf8/0x150
[   22.242067]  [<ffffffff812068c1>] object_err+0x31/0x40
[   22.242067]  [<ffffffff8120a6e5>] kasan_report_error+0x1e5/0x3f0
[   22.242067]  [<ffffffff811d9c63>] ? anon_vma_interval_tree_insert+0x123/=
0x140
[   22.242067]  [<ffffffff8120a9d4>] kasan_report+0x34/0x40
[   22.242067]  [<ffffffff8177a3e8>] ? strlcpy+0xc8/0x250
[   22.242067]  [<ffffffff81209ed4>] __asan_load8+0x64/0xa0
[   22.242067]  [<ffffffff8177a3e8>] strlcpy+0xc8/0x250
[   22.242067]  [<ffffffff8117b1b7>] cgroup_release_agent_write+0x67/0xa0
[   22.242067]  [<ffffffff81179925>] cgroup_file_write+0x75/0x180
[   22.242067]  [<ffffffff811798b0>] ? cgroup_init_cftypes+0x160/0x160
[   22.242067]  [<ffffffff812af81e>] kernfs_fop_write+0x17e/0x210
[   22.242067]  [<ffffffff8121cf67>] __vfs_write+0x57/0x170
[   22.242067]  [<ffffffff81117b73>] ? preempt_count_sub+0x13/0xe0
[   22.242067]  [<ffffffff8113c211>] ? update_fast_ctr+0x51/0x80
[   22.242067]  [<ffffffff8121d2bb>] vfs_write+0xeb/0x240
[   22.242067]  [<ffffffff8121d513>] SyS_write+0x53/0xb0
[   22.242067]  [<ffffffff8242f276>] entry_SYSCALL_64_fastpath+0x16/0x75

Best Regards,
Huang, Ying


> The lack of stack trace and the unknown commit ID make it really hard to =
analyze =

> this bug.
>
> Thanks,
>
> 	Ingo
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>
> From 53ef1538dfe8d9ed57676c567efd0d551d0a3255 Mon Sep 17 00:00:00 2001
> From: Ingo Molnar <mingo@kernel.org>
> Date: Mon, 5 Oct 2015 10:56:50 +0200
> Subject: [PATCH] string: Improve the generic strlcpy() implementation
>
> The current strlcpy() implementation has two implementational
> weaknesses:
>
> 1)
>
> There's a (largely theoretical) race:
>
> size_t strlcpy(char *dest, const char *src, size_t size)
> {
>         size_t ret =3D strlen(src);
>
>         if (size) {
>                 size_t len =3D (ret >=3D size) ? size - 1 : ret;
>                 memcpy(dest, src, len);
>                 dest[len] =3D '\0';
>         }
>         return ret;
> }
>
> If another CPU or an interrupt changes the source string after the strlen=
(), but
> before the copy is complete, and shortens the source string, then we copy=
 over the
> NUL byte of the source buffer - including fragments of earlier source str=
ing
> tails. The target buffer will still be properly NUL terminated - but it w=
ill be a
> shorter string than the returned 'ret' source buffer length. (despite the=
re not
> being truncation.)
>
> The s390 arch implementation has the same race AFAICS.
>
> This may cause bugs if the return code is subsequently used to assume tha=
t it is
> equal to the destination string's length. (While in reality it's shorter.)
>
> The race is not automatically lethal, because it's guaranteed that the re=
turned
> length is indeed zero-delimited (due to the overlong copy we did) - so if=
 the
> string is memcpy()-ed, then it will still result in a weirdly padded but =
valid
> string.
>
> But if any subsequent use of the return code relies on the return code be=
ing equal
> to a subsequent call of strlen(dest), then that use might lead to bugs. I=
.e. our
> implementation of strlcpy() is indeed racy and unrobust.
>
> But we can fix this race: by basing strlcpy() on the newly introduced str=
scpy()
> API we iterate over the string in a single go and determine the length and
> copy the string at once. Like strscpy(), but with strlcpy() return semant=
ics.
>
> This also makes strlcpy() faster.
>
> 2)
>
> Another problem is that strlcpy() will also happily do bad stuff if we pa=
ss
> it a negative size. Instead of that we will from now on print a (one time)
> warning (by virtue of strscpy()'s overflow checking) and return.
>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-kernel(a)vger.kernel.org
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> ---
>  lib/string.c | 51 +++++++++++++++++++++++++--------------------------
>  1 file changed, 25 insertions(+), 26 deletions(-)
>
> diff --git a/lib/string.c b/lib/string.c
> index 96970f8a04eb..15f41de4a1b3 100644
> --- a/lib/string.c
> +++ b/lib/string.c
> @@ -124,32 +124,6 @@ char *strncpy(char *dest, const char *src, size_t co=
unt)
>  EXPORT_SYMBOL(strncpy);
>  #endif
>  =

> -#ifndef __HAVE_ARCH_STRLCPY
> -/**
> - * strlcpy - Copy a C-string into a sized buffer
> - * @dest: Where to copy the string to
> - * @src: Where to copy the string from
> - * @size: size of destination buffer
> - *
> - * Compatible with *BSD: the result is always a valid
> - * NUL-terminated string that fits in the buffer (unless,
> - * of course, the buffer size is zero). It does not pad
> - * out the result like strncpy() does.
> - */
> -size_t strlcpy(char *dest, const char *src, size_t size)
> -{
> -	size_t ret =3D strlen(src);
> -
> -	if (size) {
> -		size_t len =3D (ret >=3D size) ? size - 1 : ret;
> -		memcpy(dest, src, len);
> -		dest[len] =3D '\0';
> -	}
> -	return ret;
> -}
> -EXPORT_SYMBOL(strlcpy);
> -#endif
> -
>  #ifndef __HAVE_ARCH_STRSCPY
>  /**
>   * strscpy - Copy a C-string into a sized buffer
> @@ -235,6 +209,31 @@ ssize_t strscpy(char *dest, const char *src, size_t =
count)
>  EXPORT_SYMBOL(strscpy);
>  #endif
>  =

> +#ifndef __HAVE_ARCH_STRLCPY
> +/**
> + * strlcpy - Copy a C-string into a sized buffer
> + * @dst: Where to copy the string to
> + * @src: Where to copy the string from
> + * @dst_size: size of destination buffer
> + *
> + * Compatible with *BSD: the result is always a valid
> + * NUL-terminated string that fits in the buffer (unless,
> + * of course, the buffer size is zero). It does not pad
> + * out the result like strncpy() does.
> + */
> +size_t strlcpy(char *dst, const char *src, size_t dst_size)
> +{
> +	int ret =3D strscpy(dst, src, dst_size);
> +
> +	/* Handle the insane and broken strlcpy() overflow return value: */
> +	if (ret < 0)
> +		return dst_size + strlen(src+dst_size);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(strlcpy);
> +#endif
> +
>  #ifndef __HAVE_ARCH_STRCAT
>  /**
>   * strcat - Append one %NUL-terminated string to another
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============6794219138972128929==--

