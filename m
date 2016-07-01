Content-Type: multipart/mixed; boundary="===============7439122449072796986=="
MIME-Version: 1.0
From: Yinghai Lu <yinghai@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/KASLR] ed9f007ee6: -- System halted
Date: Thu, 30 Jun 2016 17:24:18 -0700
Message-ID: <CAE9FiQUZSw-2XftWArfq3aBg6x7H-0Db_b-yNPbV71GeRxw7hw@mail.gmail.com>
In-Reply-To: <20160630065837.GH8951@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7439122449072796986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2016 at 11:58 PM, Ye Xiaolong <xiaolong.ye@intel.com> wro=
te:
> On Wed, Jun 29, 2016 at 09:49:12PM -0700, Yinghai Lu wrote:
>>On Wed, Jun 29, 2016 at 1:29 PM, Huang, Ying <ying.huang@intel.com> wro=
te:
>>> If you could provide a git branch for that, that will be easier for us
>>> to test and more accurate for you to get the right patch to be tested.
>>>
>>
>>Please check
>>
>>git://git.kernel.org/pub/scm/linux/kernel/git/yinghai/linux-yinghai.git
>>for-x86-v4.8-kaslr-debug
>
> Hi, yinghai
>
> Attached is the dmesg for the kernel which is built based on your
> for-x86-v4.8-kaslr-debug branch.

Thanks for capturing the boot log.

early console in setup code
early console in extract_kernel
decompress_kernel:
       input: [0x0008fba276-0x000a8818ed]
      output: [0x0001000000-0x000a867c97] 0x09867c98: output_len
              [0x0001000000-0x0009768fff] 0x08769000: run_size
              [0x0001000000-0x000a867c97] 0x09867c98: output_run_size
              [0x0001000000-0x000a8affff] 0x098b0000: init_size
ZO text/data: [0x000a8818ee-0x000a8affff]
     ZO heap: [0x000a888400-0x000a8983ff]
  VO bss/brk: [0x0009674000-0x0009768fff]
booted via startup_32()
Physical KASLR using RDTSC...
Virtual KASLR using RDTSC...
  new output: [0x0006600000-0x000fe67c97] 0x09867c98: output_run_size
   virt_addr:  0x0024000000
  decompress: [0x0006600000-0x000fe67c97] <=3D=3D=3D [0x0008fba276-0x000a88=
18ed]

Decompressing Linux...

XZ-compressed data is corrupt

 -- System halted

Hi Kees/Baoquan,

Looks like

commit ed9f007ee68478f6a50ec9971ade25a0129a5c0e
Author: Kees Cook <keescook@chromium.org>
Date:   Wed May 25 15:45:33 2016 -0700

    x86/KASLR: Extend kernel image physical address randomization to addres=
ses l
arger than 4G


cause choose_random_location() return new output buffer
new output: [0x0006600000-0x000fe67c97] 0x09867c98: output_run_size

that is overlapped with input data.
       input: [0x0008fba276-0x000a8818ed]
              ....-0x000a8affff] 0x098b0000: init_size

and input already is in mem_avoid.

--===============7439122449072796986==--

