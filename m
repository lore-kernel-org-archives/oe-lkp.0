Content-Type: multipart/mixed; boundary="===============0300537375940963262=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [uaccess] 780464aed0: WARNING:at_arch/x86/include/asm/uaccess.h:#strnlen_user/0x
Date: Sun, 03 Mar 2019 11:53:58 -0800
Message-ID: <CAHk-=wij8VLupHh1U-fFhFBjin9Fch3mG2_2=aL9h1L+WBvm2g@mail.gmail.com>
In-Reply-To: <20190303173954.kliegojbuigqi5tn@inn2.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0300537375940963262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 3, 2019 at 9:40 AM kernel test robot <lkp@intel.com> wrote:
>
> commit: 780464aed08ad00aa6d5f81ac8bef2e714dc8b06 ("[PATCH v5 2/6] uaccess=
: Use user_access_ok() in user_access_begin()")

Hmm. Not an upstream commit ID, so this is presumably a backport.

Ok, let's see what it is using the web link:

> url: https://github.com/0day-ci/linux/commits/Masami-Hiramatsu/tracing-pr=
obes-uaccess-Add-support-user-space-access/20190303-203749

Yeah, that just gives a github 404 error.

I'm _assuming_ it's the WARN_ON_IN_IRQ() in the access_ok().

Which doesn't much make sense either (why wouldn't it happen in
mainline)? But without a useful web link to see what is actually being
tested, I guess it's not something I can even look at...

                      Linus

--===============0300537375940963262==--

