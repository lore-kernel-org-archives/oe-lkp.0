Content-Type: multipart/mixed; boundary="===============2310344058605027604=="
MIME-Version: 1.0
From: Dave Hansen <dave.hansen@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/tlb] 6035152d8e: will-it-scale.per_thread_ops -13.2% regression
Date: Thu, 17 Mar 2022 13:49:48 -0700
Message-ID: <285cf565-ebf7-8cf5-4e57-2245608e79fb@intel.com>
In-Reply-To: <DC37F01B-A80F-4839-B4FB-C21F64943E64@vmware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2310344058605027604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/17/22 13:32, Nadav Amit wrote:
> Can you please clarify how the bot works - did it notice a performance
> regression and then started bisecting, or did it just check one patch
> at a time?

Oliver can tell us for sure, but it usually finds things by bisecting.
It will pick an upstream commit and compare it to the latest baseline.
If it sees a delta it starts bisecting for the triggering commit.

It isn't a literal 'git bisect', but it's logically similar.

I did ask the 0day folks privately if they had any more performance data
on that commit: good, bad or neutral.

That commit didn't actually look to me like it was fundamental to
anything built after it.  It might not revert cleanly, but it doesn't
look like it would be hard to logically remove.  What other side-effects
are you worried about?

BTW, there's also a dirt simple hack to do the on_each_cpu_cond_mask()
without a retpoline:

	if ((cond_func =3D=3D tlb_is_not_lazy) &&
            !tlb_is_not_lazy(...))
		continue;

You can't do that literally in arch-independent code, but you get the point.

I know folks have discussed ways of doing this kind of stuff for other
high-value indirect calls.  I need to see if there's anything around
that we could use.
--===============2310344058605027604==--

