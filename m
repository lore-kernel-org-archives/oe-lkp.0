Content-Type: multipart/mixed; boundary="===============0632406707215758023=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [uaccess] 780464aed0: WARNING:at_arch/x86/include/asm/uaccess.h:#strnlen_user/0x
Date: Mon, 04 Mar 2019 11:20:19 +0800
Message-ID: <d0cfee27-b2e8-e1ce-1fb9-5ada0c632777@intel.com>
In-Reply-To: <CAHk-=wij8VLupHh1U-fFhFBjin9Fch3mG2_2=aL9h1L+WBvm2g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0632406707215758023==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 3/4/19 3:53 AM, Linus Torvalds wrote:
> On Sun, Mar 3, 2019 at 9:40 AM kernel test robot <lkp@intel.com> wrote:
>> commit: 780464aed08ad00aa6d5f81ac8bef2e714dc8b06 ("[PATCH v5 2/6] uacces=
s: Use user_access_ok() in user_access_begin()")
> Hmm. Not an upstream commit ID, so this is presumably a backport.
>
> Ok, let's see what it is using the web link:
>
>> url: https://github.com/0day-ci/linux/commits/Masami-Hiramatsu/tracing-p=
robes-uaccess-Add-support-user-space-access/20190303-203749
> Yeah, that just gives a github 404 error.


Sorry for the broken link,=C2=A0 It's ok now.

Best Regards,
Rong Chen


>
> I'm _assuming_ it's the WARN_ON_IN_IRQ() in the access_ok().
>
> Which doesn't much make sense either (why wouldn't it happen in
> mainline)? But without a useful web link to see what is actually being
> tested, I guess it's not something I can even look at...
>
>                        Linus
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============0632406707215758023==--

