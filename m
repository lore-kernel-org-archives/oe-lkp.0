Content-Type: multipart/mixed; boundary="===============7705498825596867081=="
MIME-Version: 1.0
From: Dave Hansen <dave.hansen@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [bisect done] e71e836f46 [ 17.567570] WARNING: CPU: 0 PID: 1 at arch/x86/include/asm/pgtable.h:540 __change_page_attr_set_clr
Date: Tue, 10 Apr 2018 13:59:21 -0700
Message-ID: <8b734592-0973-b8e3-a1a7-229cdcd8a529@linux.intel.com>
In-Reply-To: <20180410011232.ooo3u7v7uxkqoz2o@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7705498825596867081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/09/2018 06:12 PM, kernel test robot wrote:
> +-----------------------------------------------------------------------+=
------------+------------+------------+------------+
> |                                                                       |=
 64c8075940 | e71e836f46 | 0564258fb2 | 87e1e2f51c |
> +-----------------------------------------------------------------------+=
------------+------------+------------+------------+
> | boot_successes                                                        |=
 35         | 0          | 19         | 11         |
> | boot_failures                                                         |=
 0          | 26         |            |            |
> | WARNING:at_arch/x86/include/asm/pgtable.h:#__change_page_attr_set_clr |=
 0          | 26         |            |            |
> | RIP:__change_page_attr_set_clr                                        |=
 0          | 26         |            |            |
> +-----------------------------------------------------------------------+=
------------+------------+------------+------------+

LKP folks, does this mean that the system didn't boot in all the places
that we saw this warning?  Or does this just say that it *had* the
warning 26 times?

I looked into this a bit.  This LKP report points the finger at this
commit which trips over a new debugging WARN_ON() I added:

[patch 06/11] x86/mm: Remove extra filtering in pageattr code

It's because set_memory_nx() encounters the (unsupported) _PAGE_GLOBAL
bit while clearing _PAGE_NX.  I never saw this in testing because this
patch:

[PATCH 10/11] x86/pti: never implicitly clear _PAGE_GLOBAL for kernel image

explicitly clears out _PAGE_GLOBAL long before the set_memory_nx() call.
So I *think* this is a transient issue resulting in bad ordering of the
_PAGE_GLOBAL patch set.  I believe it is harmless.

If anyone is encountering real issues, please speak up.

--===============7705498825596867081==--

