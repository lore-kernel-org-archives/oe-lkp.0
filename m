Content-Type: multipart/mixed; boundary="===============1026328263875544356=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/KASLR] ed9f007ee6: -- System halted
Date: Wed, 29 Jun 2016 13:29:28 -0700
Message-ID: <87y45nyc0n.fsf@yhuang-mobile.sh.intel.com>
In-Reply-To: <CAE9FiQVMq+fBDyZpghSndmYu6dF0Am4h9nWn1_fJjwOR5VKHug@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1026328263875544356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Yinghai,

Yinghai Lu <yinghai@kernel.org> writes:

> On Tue, Jun 28, 2016 at 12:49 PM, Yinghai Lu <yinghai@kernel.org> wrote:
>> On Mon, Jun 27, 2016 at 10:43 PM, Ye Xiaolong <xiaolong.ye@intel.com> =
wrote:
>>> On Mon, Jun 27, 2016 at 11:59:37AM -0700, Yinghai Lu wrote:
>>>>output is:
>>>>
>>>>early console in setup code
>>>>early console in extract_kernel
>>>>input_data: 0x0000000008fbb276
>>>>input_len: 0x00000000018c6e00
>>>>output: 0x0000000001000000
>>>>output_len: 0x0000000009867c98
>>>>kernel_total_size: 0x0000000008769000
>>>>booted via startup_32()
>>>>Physical KASLR using RDTSC...
>>>>Virtual KASLR using RDTSC...
>>>>
>>>>Decompressing Linux...
>>>>
>>>>XZ-compressed data is corrupt
>>>>
>>>> -- System halted
>>>>
>>>>Can you apply attached debug patch and send out dmesg?
>>>
>>> There are 4 patches you attached, do you mean to apply them all based on
>>> commit ed9f007ee6? I tried and seemed they can't apply clearly on it.
>>
>
> Please check attached updated debug patches.
>
> You should apply them after ed9f007ee6 in following sequence
>
> revert_79063a7.patch
> early_console_more_2_2x.patch
> early_console_more_2_2x_add_0.patch
> early_console_more_2_2x_add_1.patch

If you could provide a git branch for that, that will be easier for us
to test and more accurate for you to get the right patch to be tested.

Best Regards,
Huang, Ying

--===============1026328263875544356==--

