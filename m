Content-Type: multipart/mixed; boundary="===============2296066737478026354=="
MIME-Version: 1.0
From: Dave Young <dyoung@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86/boot] 5b51ae969e: kexec boot failed
Date: Fri, 02 Aug 2019 15:59:49 +0800
Message-ID: <20190802075949.GA4681@dhcp-128-65.nay.redhat.com>
In-Reply-To: <97f74c86-54bd-f165-ce33-b53ca48ab850@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2296066737478026354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 08/02/19 at 03:48pm, kernel test robot wrote:
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
> =


Does moving line of "sanitize_boot_params(boot_params);" after get_rsdp_add=
r()
callback work?

Thanks
Dave

--===============2296066737478026354==--

