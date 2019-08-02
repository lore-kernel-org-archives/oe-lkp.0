Content-Type: multipart/mixed; boundary="===============9073194257144490898=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/boot] 5b51ae969e: kexec boot failed
Date: Fri, 02 Aug 2019 11:30:24 +0200
Message-ID: <20190802093024.GB30710@zn.tnic>
In-Reply-To: <97f74c86-54bd-f165-ce33-b53ca48ab850@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9073194257144490898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 02, 2019 at 03:48:53PM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 5b51ae969e3d8ab0134ee3c98a769ad6d2cc2e24 ("x86/boot: Call get_rsd=
p_addr() after console_init()")
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.g=
it  master
> =

> in testcase: boot
> =

> on test machine: Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 4G memory
> =

> The commit broke kexec boot on physical machines, We have to set "nokaslr=
" to kernel cmdline to avoid the issue.

How exactly do you trigger it? Details?

-- =

Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah, HRB =
21284 (AG N=C3=BCrnberg)

--===============9073194257144490898==--

