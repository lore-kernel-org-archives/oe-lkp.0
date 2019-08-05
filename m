Content-Type: multipart/mixed; boundary="===============0168303211908159917=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/boot] 5b51ae969e: kexec boot failed
Date: Mon, 05 Aug 2019 19:49:54 +0800
Message-ID: <0f817336-2d87-2110-13c0-e0a417d70e90@intel.com>
In-Reply-To: <20190802093024.GB30710@zn.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============0168303211908159917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 8/2/2019 5:30 PM, Borislav Petkov wrote:
> On Fri, Aug 02, 2019 at 03:48:53PM +0800, kernel test robot wrote:
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: 5b51ae969e3d8ab0134ee3c98a769ad6d2cc2e24 ("x86/boot: Call get_rs=
dp_addr() after console_init()")
>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.=
git  master
>>
>> in testcase: boot
>>
>> on test machine: Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 4G memory
>>
>> The commit broke kexec boot on physical machines, We have to set "nokasl=
r" to kernel cmdline to avoid the issue.
> How exactly do you trigger it? Details?
>

We use the following command to boot a new kernel:
kexec --noefi -l =

/opt/rootfs/tmp/pkg/linux/x86_64-rhel-7.6/gcc-7/5b51ae969e3d8ab0134ee3c98a7=
69ad6d2cc2e24/vmlinuz-5.2.0-rc3-00004-g5b51ae969e3d8a =

--initrd=3D/opt/rootfs/tmp/initrd-concatenated

Best Regards,
Rong Chen



--===============0168303211908159917==--

