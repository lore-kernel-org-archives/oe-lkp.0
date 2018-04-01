Content-Type: multipart/mixed; boundary="===============5408588280120568458=="
MIME-Version: 1.0
From: Thomas Hellstrom <thellstrom@vmware.com>
To: lkp@lists.01.org
Subject: Re: 20fb5a635a ("drm/vmwgfx: Unpin the screen object backup buffer .."): kernel BUG at arch/x86/mm/physaddr.c:80!
Date: Sun, 01 Apr 2018 18:51:26 +0200
Message-ID: <aa177f3a-c2f6-f28a-dd8e-c3eecf4579fd@vmware.com>
In-Reply-To: <5ac0e6ef.OOpRvF3tCq18T+nZ%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5408588280120568458==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!

On 04/01/2018 04:04 PM, kernel test robot wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.kernel.org_pub=
_scm_linux_kernel_git_next_linux-2Dnext.git&d=3DDwICAg&c=3DuilaK90D4TOVoH58=
JNXRgQ&r=3DwnSlgOCqfpNS4d02vP68_E9q2BNMCwfD2OZ_6dCFVQQ&m=3D6P1OKBGDQZQchYh0=
wduEGks8OinHwUL4pKSyWNnVObI&s=3DhvboyvPaP7k_0_EkmCesLZD-e0JlXyISLDYoLWhA5xg=
&e=3D master
>
> commit 20fb5a635a0c8478ac98f15cfafc2ea83df29565
> Author:     Thomas Hellstrom <thellstrom@vmware.com>
> AuthorDate: Thu Mar 22 10:35:18 2018 +0100
> Commit:     Thomas Hellstrom <thellstrom@vmware.com>
> CommitDate: Thu Mar 22 12:08:24 2018 +0100
>
>      drm/vmwgfx: Unpin the screen object backup buffer when not used
>      =

I don't think this commit is to blame, since nothing in the dmesg =

indicates that the vmwgfx module is even loaded.
More likely this is a false bad bisect due to an intermittent failure.

Thanks,
Thomas


--===============5408588280120568458==--

