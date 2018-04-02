Content-Type: multipart/mixed; boundary="===============3495506555484745802=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: 20fb5a635a ("drm/vmwgfx: Unpin the screen object backup buffer .."): kernel BUG at arch/x86/mm/physaddr.c:80!
Date: Mon, 02 Apr 2018 11:51:24 +0800
Message-ID: <20180402035124.gj4n4n67vpq2hbam@wfg-t540p.sh.intel.com>
In-Reply-To: <aa177f3a-c2f6-f28a-dd8e-c3eecf4579fd@vmware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3495506555484745802==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 01, 2018 at 06:51:26PM +0200, Thomas Hellstrom wrote:
>Hi!
>
>On 04/01/2018 04:04 PM, kernel test robot wrote:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.kernel.org_pu=
b_scm_linux_kernel_git_next_linux-2Dnext.git&d=3DDwICAg&c=3DuilaK90D4TOVoH5=
8JNXRgQ&r=3DwnSlgOCqfpNS4d02vP68_E9q2BNMCwfD2OZ_6dCFVQQ&m=3D6P1OKBGDQZQchYh=
0wduEGks8OinHwUL4pKSyWNnVObI&s=3DhvboyvPaP7k_0_EkmCesLZD-e0JlXyISLDYoLWhA5x=
g&e=3D master
>>
>> commit 20fb5a635a0c8478ac98f15cfafc2ea83df29565
>> Author:     Thomas Hellstrom <thellstrom@vmware.com>
>> AuthorDate: Thu Mar 22 10:35:18 2018 +0100
>> Commit:     Thomas Hellstrom <thellstrom@vmware.com>
>> CommitDate: Thu Mar 22 12:08:24 2018 +0100
>>
>>      drm/vmwgfx: Unpin the screen object backup buffer when not used
>>
>I don't think this commit is to blame, since nothing in the dmesg
>indicates that the vmwgfx module is even loaded.
>More likely this is a false bad bisect due to an intermittent failure.

Yeah sorry for that -- this happens about 1 out of 1000 boots. So rare
so that the bisect may well be wrong.

+------------------------------------------+------------+------------+-----=
----------+
|                                          | 89dc15b76f | 20fb5a635a | next=
-20180329 |
+------------------------------------------+------------+------------+-----=
----------+
| boot_successes                           | 1023       | 912        | 720 =
          |
| boot_failures                            | 0          | 1          | 2   =
          |
| kernel_BUG_at_arch/x86/mm/physaddr.c     | 0          | 1          | 1   =
          |
| invalid_opcode:#[##]                     | 0          | 1          | 1   =
          |
| EIP:__phys_addr                          | 0          | 1          | 1   =
          |
| Kernel_panic-not_syncing:Fatal_exception | 0          | 1          | 1   =
          |
| Mem-Info                                 | 0          | 0          | 1   =
          |
+------------------------------------------+------------+------------+-----=
----------+

Thanks,
Fengguang

--===============3495506555484745802==--

