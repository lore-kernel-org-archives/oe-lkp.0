Content-Type: multipart/mixed; boundary="===============4499842799267589472=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] c566586818: BUG:kernel_hang_in_early-boot_stage, last_printk:Probing_EDD(edd=off_to_disable)...ok
Date: Thu, 27 Aug 2020 17:16:47 +0800
Message-ID: <120c99ce-6439-2945-e990-588c42a9e582@intel.com>
In-Reply-To: <20200826173010.GD24545@gaia>
List-Id: <oe-lkp.lists.linux.dev>

--===============4499842799267589472==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 8/27/20 1:30 AM, Catalin Marinas wrote:
> On Tue, Aug 25, 2020 at 11:02:40PM -0400, Qian Cai wrote:
>> On Aug 25, 2020, at 8:44 PM, Rong Chen <rong.a.chen@intel.com> wrote:
>>> I rebuilt the kernel on commit c566586818 but the error changed to
>>> "RIP: 0010:clear_page_orig+0x12/0x40", and the error can be
>>> reproduced on parent commit:
>> Catalin, any thought? Sounds like those early kmemleak allocations
>> cause some sort of memory corruption?
> I can't immediately see how but Rong implies that the error also happens
> on the parent commit. Does it mean the bisection isn't entirely right?
>

Hi Catalin,

The original bisection is for "BUG:kernel_hang_in_early-boot_stage" =

which locate to commit c566586818,
and the boot will go on and meet the error "RIP: =

0010:clear_page_orig+0x12/0x40" if we set
CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=3D400, but the error shouldn't cause =

by commit c566586818
because we can reproduce the error on parent commit.

Best Regards,
Rong Chen
--===============4499842799267589472==--

